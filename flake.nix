{
  description = "copier-mr-minimal dev shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { self, nixpkgs, treefmt-nix }:
    let
      eachSystem = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
    in
    {
      formatter = eachSystem (
        system: treefmt-nix.lib.mkWrapper nixpkgs.legacyPackages.${system} ./treefmt.nix
      );

      devShells = eachSystem (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.bun
              pkgs.prettypst
              pkgs.uv
              pkgs.yq-go
              pkgs.nil
              pkgs.nixd
              (treefmt-nix.lib.mkWrapper pkgs ./treefmt.nix)
            ];
          };
        }
      );
    };
}