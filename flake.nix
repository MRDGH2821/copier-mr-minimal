{
  description = "copier-mr-minimal dev shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = {nixpkgs}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        alejandra
        bun
        libxml2
        prettypst
        shfmt
        treefmt
        uv
        yq-go
        nil
        nixd
        nixfmt
        nixpkgs-fmt
      ];
    };
  };
}
