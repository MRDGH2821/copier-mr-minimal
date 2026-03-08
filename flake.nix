{
  description = "copier-mr-minimal dev shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    alejandra.url = "github:kamadorueda/alejandra/4.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = {
    self,
    nixpkgs,
    alejandra,
    treefmt-nix,
  }: let
    system = builtins.currentSystem;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      name = "copier-mr-minimal";

      packages = with pkgs; [
        alejandra.${system}.default
        bash
        bun
        libxml2
        prettypst
        shfmt
        treefmt
        uv
        yq-go
      ];
    };
    treefmt-nix.mkWrapper nixpkgs = {
      projectRootFile = ".git/config";
      
    };
  };
}
