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

          #
          pkgs.libX11
          pkgs.libXext
          pkgs.libXrender
          pkgs.libXi
          pkgs.libXrandr
          pkgs.libXcursor
          pkgs.libXfixes
          pkgs.libXdamage
          pkgs.libXcomposite
          pkgs.mesa
          pkgs.glib
          pkgs.gtk3
          pkgs.adwaita-icon-theme
        ];
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = self.packages.${system}.default;
        shellHook = ''
          echo "quantar breakout board dev shell loaded"
        '';
      };
    };
}
