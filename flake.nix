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
