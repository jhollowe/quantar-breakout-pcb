{
  description = "quantar breakout board: PCB development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.default = pkgs.buildEnv {
        name = "homelab-apps-devshell";
        paths = [
          pkgs.kicad
          pkgs.tigervnc
          pkgs.novnc
          pkgs.websockify
          pkgs.openbox
          pkgs.xterm
          pkgs.mesa
          pkgs.glib
          pkgs.gtk3
          pkgs.adwaita-icon-theme
          pkgs.fontconfig
          pkgs.dejavu_fonts
        ];
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = self.packages.${system}.default;
        shellHook = ''
          echo "quantar breakout board dev shell loaded"
          echo ""
          echo "To start KiCad in browser:"
          echo "  1. Run: start-vnc"
          echo "  2. Open browser to: http://localhost:6080/vnc.html"
          echo "  3. In terminal, run: kicad"
        '';
        PATH = [ ./devcontainer/scripts ];
      };
    };
}
