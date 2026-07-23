{
  description = "copier-mr-minimal dev shell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    git-hooks.url = "github:cachix/git-hooks.nix";
    llm-agents.url = "github:numtide/llm-agents.nix";
    mcp-servers-nix.url = "github:natsukium/mcp-servers-nix";
  };
  outputs = {
    self,
    systems,
    nixpkgs,
    git-hooks,
    treefmt-nix,
    ...
  } @ inputs: let
    forEachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});
    treefmtEval = forEachSystem (pkgs: treefmt-nix.lib.evalModule pkgs ./treefmt.nix);
  in {
    formatter = forEachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);
    checks = forEachSystem (pkgs: {
      formatting = treefmtEval.${pkgs.system}.config.build.check self;
      pre-commit-check = git-hooks.lib.${pkgs.system}.run {
        src = ./.;
        hooks = {
          treefmt.enable = true;
          treefmt.packageOverrides.treefmt = treefmtEval.${pkgs.system}.config.build.wrapper;
          check-merge-conflicts.enable = true;
        };
      };
    });
    devShells = forEachSystem (
      pkgs: let
        llmAgentPkgs = inputs.llm-agents.packages.${pkgs.system};
        claudeMcpConfig = inputs.mcp-servers-nix.lib.mkConfig pkgs {
          flavor = "claude-code";
          programs = {
            filesystem = {
              enable = true;
              args = ["."];
            };
            nixos.enable = true;
          };
        };
        opencodeMcpConfig = inputs.mcp-servers-nix.lib.mkConfig pkgs {
          flavor = "opencode";
          fileName = "opencode.json";
          programs = {
            filesystem = {
              enable = true;
              args = ["."];
            };
            nixos.enable = true;
          };
          settings."$schema" = "https://opencode.ai/config.json";
        };
        inherit (self.checks.${pkgs.system}.pre-commit-check) shellHook enabledPackages;
      in {
        default = pkgs.mkShell {
          shellHook = ''
            ln -sfn ${claudeMcpConfig} .mcp.json
            ln -sfn ${opencodeMcpConfig} opencode.json
            ${shellHook}
          '';
          buildInputs = enabledPackages;
          packages = with pkgs; [
            alejandra
            bun
            libxml2
            nil
            nixd
            nixfmt
            prettypst
            shfmt
            treefmt
            uv
            yq-go
            llmAgentPkgs."claude-code"
            llmAgentPkgs.opencode
          ];
        };
      }
    );
  };
}
