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
    blueprint.url = "github:numtide/blueprint";
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

  outputs = inputs:
    inputs.blueprint {
      inherit inputs;
      prefix = "nix/";
    };
}
