{ pkgs ? import <nixpkgs> {} }:
let python = 
    pkgs.python38.withPackages (ps: [ps.pyqt5 ps.paramiko ps.twisted ps.pip])
    ;

in pkgs.mkShell {
  buildInputs = [
    pkgs.hello

    # keep this line if you use bash
    pkgs.bashInteractive
    pkgs.gnumake
    python
  ];

  nativeBuildInputs = [
    pkgs.qt5.wrapQtAppsHook
  ];
}
