{ sources ? import ./nix/sources.nix
, nixpkgs ? import sources.nixpkgs {}
, pythonPackages ? nixpkgs.python38Packages
}:

with pythonPackages;
buildPythonApplication rec {
  pname = "rmview";
  version = "2.1";
  src = ./.;
  propagatedBuildInputs = [
    pyqt5 paramiko twisted 
  ];
  propagatedNativeBuildInputs = [
    nixpkgs.qt5.wrapQtAppsHook
  ];
  preFixup = ''
      wrapQtApp "$out/bin/rmview" --prefix PATH : $out/bin/rmview
  '';
}
