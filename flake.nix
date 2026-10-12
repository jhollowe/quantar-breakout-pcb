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

      basePackages = [ pkgs.kicad-small ];

      webUIPackages = [
        pkgs.tigervnc
        pkgs.novnc
        pkgs.python3Packages.websockify
        pkgs.openbox
        pkgs.xterm
        pkgs.xinit
        pkgs.xauth
        pkgs.mesa
        pkgs.glib
        pkgs.gtk3
        pkgs.adwaita-icon-theme
        pkgs.fontconfig
        pkgs.dejavu_fonts
      ];

    in
    {
      packages.${system} = {
        default = pkgs.buildEnv {
          name = "homelab-apps-devshell";
          paths = basePackages;
        };
        with-webui = pkgs.buildEnv {
          name = "homelab-apps-devshell";
          paths = basePackages ++ webUIPackages;
        };
      };

      devShells.${system} = {
        default = pkgs.mkShell {
          packages = basePackages;
          shellHook = ''
            echo "quantar breakout board dev shell loaded"
            echo ""
            echo "WebUI not included. Use 'nix develop .#with-webui' to enable."
          '';
          PATH = [ ./.devcontainer/scripts ];
        };

        # Alternative devShell with webUI enabled
        with-webui = pkgs.mkShell {
          packages = basePackages ++ webUIPackages;
          shellHook = ''
            echo "quantar breakout board dev shell loaded (with WebUI)"
            echo ""
            echo "To start KiCad in browser:"
            echo "  1. Run: start-vnc"
            echo "  2. Open browser to: http://localhost:6080/vnc.html (password kicad123)"
            echo "  3. In terminal, run: start-kicad"
          '';
          PATH = [ ./.devcontainer/scripts ];
        };
      };
    };
}
