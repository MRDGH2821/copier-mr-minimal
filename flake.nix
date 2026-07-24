{
  description = "copier-mr-minimal dev shell";

  nixConfig = {
    extra-substituters = ["https://cache.numtide.com"];
    extra-trusted-public-keys = ["niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="];
  };

  inputs = {
    # keep-sorted start
    agent-skills.inputs.nixpkgs.follows = "nixpkgs";
    agent-skills.url = "github:Kyure-A/agent-skills-nix";
    git-hooks.inputs.nixpkgs.follows = "nixpkgs";
    git-hooks.url = "github:cachix/git-hooks.nix";
    llm-agents.inputs.nixpkgs.follows = "nixpkgs";
    llm-agents.inputs.systems.follows = "systems";
    llm-agents.inputs.treefmt-nix.follows = "treefmt-nix";
    llm-agents.url = "github:numtide/llm-agents.nix";
    mcp-servers-nix.inputs.nixpkgs.follows = "nixpkgs";
    mcp-servers-nix.url = "github:natsukium/mcp-servers-nix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    # keep-sorted end
    awesome-copilot = {
      url = "github:github/awesome-copilot";
      flake = false;
    };
  };

  outputs = {
    self,
    # keep-sorted start
    git-hooks,
    nixpkgs,
    systems,
    treefmt-nix,
    # keep-sorted end
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
        package = pkgs.prek;
        hooks = {
          treefmt = {
            enable = true;
            entry = "${treefmtEval.${pkgs.system}.config.build.wrapper}/bin/treefmt";
          };
          check-merge-conflicts.enable = true;
          cspell = {
            enable = true;
            args = [
              "--config"
              ".cspell.json"
            ];
          };
          cspell-commit-msg = {
            enable = true;
            name = "Check commit message spelling";
            entry = "${pkgs.cspell}/bin/cspell";
            args = [
              "--config"
              ".cspell.json"
              "--no-must-find-files"
              "--no-progress"
              "--no-summary"
              "--files"
              ".git/COMMIT_EDITMSG"
            ];
            always_run = true;
            stages = ["commit-msg"];
          };
          ggshield = {
            enable = true;
            name = "ggshield";
            entry = "${pkgs.writeShellScriptBin "ggshield-hook" ''
              export PYTHONPATH="${pkgs.python313Packages.packaging}/${pkgs.python313.sitePackages}:$PYTHONPATH"
              exec ${pkgs.ggshield}/bin/ggshield secret scan pre-commit "$@"
            ''}/bin/ggshield-hook";
            stages = ["pre-commit"];
          };
          forbidden-files = {
            enable = true;
            name = "forbidden files";
            entry = "found Copier update rejection files; review and remove them before merging.";
            files = "\\.rej$";
            language = "fail";
          };
          cocogitto = {
            enable = true;
            name = "Cocogitto commits check";
            entry = "${pkgs.cocogitto}/bin/cog verify --file";
            stages = ["commit-msg"];
          };
        };
      };
    });

    devShells = forEachSystem (
      pkgs: let
        llmAgentPkgs = inputs.llm-agents.packages.${pkgs.system};

        mcpOpencodeConfig = inputs.mcp-servers-nix.lib.mkConfig pkgs {
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

        agentLib = inputs.agent-skills.lib.agent-skills;

        skillsSources = {
          awesome-copilot = {
            path = inputs.awesome-copilot;
            subdir = "skills";
          };
        };

        skillsCatalog = agentLib.discoverCatalog skillsSources;

        skillsSelection = agentLib.selectSkills {
          catalog = skillsCatalog;
          allowlist = ["git-commit"];
          sources = skillsSources;
        };

        skillsBundle = agentLib.mkBundle {
          inherit pkgs;
          selection = skillsSelection;
        };

        localSkillsTargets = {
          antigravity =
            agentLib.defaultLocalTargets.antigravity
            // {
              enable = true;
            };
          copilot =
            agentLib.defaultLocalTargets.copilot
            // {
              enable = true;
            };
          cursor =
            agentLib.defaultLocalTargets.cursor
            // {
              enable = true;
            };
          opencode =
            agentLib.defaultLocalTargets.opencode
            // {
              enable = true;
            };
        };

        skillsShellHook = agentLib.mkShellHook {
          inherit pkgs;
          bundle = skillsBundle;
          targets = localSkillsTargets;
        };

        gitHooksCheck = self.checks.${pkgs.system}.pre-commit-check;
        inherit (gitHooksCheck) shellHook enabledPackages;
      in {
        default = pkgs.mkShell {
          shellHook = ''

            ln -sfn ${mcpOpencodeConfig} opencode.json
            mkdir -p .vscode

            ${shellHook}
            ${skillsShellHook}
          '';
          buildInputs = enabledPackages;
          packages = with pkgs; [
            # keep-sorted start
            llmAgentPkgs.antigravity-cli
            llmAgentPkgs.apm
            llmAgentPkgs.copilot-cli
            llmAgentPkgs.cursor-agent
            llmAgentPkgs.git-surgeon
            llmAgentPkgs.opencode
            llmAgentPkgs.rtk
            nil
            nixd
            # keep-sorted end
          ];
        };
      }
    );
  };
}
