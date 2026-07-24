# Integration of numtide/blueprint Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Refactor `flake.nix` by integrating `numtide/blueprint` with `prefix = "nix/";` to split devshell, formatter, checks, MCP config, and agent skills into modular files inside `nix/`.

**Architecture:** Split the monolithic `flake.nix` into dedicated Nix expressions inside `nix/`: `nix/formatter.nix`, `nix/checks/formatting.nix`, `nix/checks/pre-commit-check.nix`, `nix/mcp.nix`, `nix/skills.nix`, and `nix/devshell.nix`. Use `inputs.blueprint` with `prefix = "nix/";` in `flake.nix` to automatically discover and expose outputs.

**Tech Stack:** Nix, Flakes, numtide/blueprint, treefmt-nix, git-hooks.nix, mcp-servers-nix, agent-skills-nix.

## Global Constraints

- Follow Conventional Commits format for commits with scope `nix` (e.g. `refactor(nix): ...`).
- Every commit MUST include the trailer: `Co-authored-by: Gemini 3.6 Flash via Antigravity <noreply@google.com>`.
- Update `.agents/logs/2026-07-24.md` for AI work documentation.

---

### Task 1: Create `nix/formatter.nix` and `nix/checks/formatting.nix`

**Files:**

- Create: `nix/formatter.nix`
- Create: `nix/checks/formatting.nix`

**Interfaces:**

- Consumes: `inputs.treefmt-nix`, `./treefmt.nix`
- Produces: `formatter.<system>` and `checks.<system>.formatting`

- [ ] **Step 1: Create `nix/formatter.nix`**

```nix
{ pkgs, inputs, ... }:
(inputs.treefmt-nix.lib.evalModule pkgs ./../treefmt.nix).config.build.wrapper
```

- [ ] **Step 2: Create `nix/checks/formatting.nix`**

```nix
{ pkgs, inputs, flake, ... }:
(inputs.treefmt-nix.lib.evalModule pkgs ./../../treefmt.nix).config.build.check flake
```

- [ ] **Step 3: Commit Task 1**

```bash
git add nix/formatter.nix nix/checks/formatting.nix
git commit -m "feat(nix): add formatter and formatting check for blueprint

Co-authored-by: Gemini 3.6 Flash via Antigravity <noreply@google.com>"
```

---

### Task 2: Create `nix/checks/pre-commit-check.nix`

**Files:**

- Create: `nix/checks/pre-commit-check.nix`

**Interfaces:**

- Consumes: `inputs.git-hooks`, `inputs.treefmt-nix`, `pkgs`, `system`
- Produces: `checks.<system>.pre-commit-check`

- [ ] **Step 1: Create `nix/checks/pre-commit-check.nix`**

```nix
{ pkgs, inputs, system, ... }:
let
  treefmtWrapper = (inputs.treefmt-nix.lib.evalModule pkgs ./../../treefmt.nix).config.build.wrapper;
in
inputs.git-hooks.lib.${system}.run {
  src = ./../..;
  package = pkgs.prek;
  hooks = {
    treefmt = {
      enable = true;
      entry = "${treefmtWrapper}/bin/treefmt";
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
}
```

- [ ] **Step 2: Commit Task 2**

```bash
git add nix/checks/pre-commit-check.nix
git commit -m "feat(nix): add pre-commit-check module for blueprint

Co-authored-by: Gemini 3.6 Flash via Antigravity <noreply@google.com>"
```

---

### Task 3: Create `nix/mcp.nix` and `nix/skills.nix`

**Files:**

- Create: `nix/mcp.nix`
- Create: `nix/skills.nix`

**Interfaces:**

- Consumes: `inputs.mcp-servers-nix`, `inputs.agent-skills`, `inputs.awesome-copilot`
- Produces: `mcpOpencodeConfig` derivation and `skillsShellHook` script snippet

- [ ] **Step 1: Create `nix/mcp.nix`**

```nix
{ pkgs, inputs, ... }:
inputs.mcp-servers-nix.lib.mkConfig pkgs {
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
}
```

- [ ] **Step 2: Create `nix/skills.nix`**

```nix
{ pkgs, inputs, ... }:
let
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
    agents =
      agentLib.defaultLocalTargets.agents
      // {
        enable = true;
      };
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
in
agentLib.mkShellHook {
  inherit pkgs;
  bundle = skillsBundle;
  targets = localSkillsTargets;
}
```

- [ ] **Step 3: Commit Task 3**

```bash
git add nix/mcp.nix nix/skills.nix
git commit -m "feat(nix): add mcp and skills modules for blueprint

Co-authored-by: Gemini 3.6 Flash via Antigravity <noreply@google.com>"
```

---

### Task 4: Create `nix/devshell.nix` and Refactor `flake.nix`

**Files:**

- Create: `nix/devshell.nix`
- Modify: `flake.nix`

**Interfaces:**

- Consumes: `nix/mcp.nix`, `nix/skills.nix`, `flake.checks.${system}.pre-commit-check`, `inputs.blueprint`
- Produces: `devShells.<system>.default` and full Blueprint flake evaluation

- [ ] **Step 1: Create `nix/devshell.nix`**

```nix
{ pkgs, inputs, flake, system, ... }:
let
  mcpOpencodeConfig = import ./mcp.nix { inherit pkgs inputs; };
  skillsShellHook = import ./skills.nix { inherit pkgs inputs; };
  gitHooksCheck = flake.checks.${system}.pre-commit-check;
  inherit (gitHooksCheck) shellHook enabledPackages;
in
pkgs.mkShell {
  shellHook = ''

    ln -sfn ${mcpOpencodeConfig} opencode.json
    mkdir -p .vscode

    ${shellHook}
    ${skillsShellHook}
  '';
  buildInputs = enabledPackages;
  packages = with pkgs; [
    inputs.llm-agents.packages.${system}.antigravity-cli
    inputs.llm-agents.packages.${system}.apm
    inputs.llm-agents.packages.${system}.copilot-cli
    inputs.llm-agents.packages.${system}.cursor-agent
    inputs.llm-agents.packages.${system}.git-surgeon
    inputs.llm-agents.packages.${system}.opencode
    inputs.llm-agents.packages.${system}.rtk
    nil
    nixd
  ];
}
```

- [ ] **Step 2: Refactor `flake.nix` to use Blueprint**

Update `flake.nix`:

```nix
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
    blueprint.inputs.nixpkgs.follows = "nixpkgs";
    blueprint.inputs.systems.follows = "systems";
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

  outputs = inputs: inputs.blueprint {
    inherit inputs;
    prefix = "nix/";
  };
}
```

- [ ] **Step 3: Commit Task 4**

```bash
git add nix/devshell.nix flake.nix
git commit -m "refactor(nix): integrate numtide/blueprint and split devshell

Co-authored-by: Gemini 3.6 Flash via Antigravity <noreply@google.com>"
```

---

### Task 5: Verification & Formatting

**Files:**

- Modify: `flake.lock` (auto-updated by nix lock/eval)

- [ ] **Step 1: Test Flake Evaluation and Checks**

Run: `nix flake check --no-write-lock-file`
Expected: Zero errors, clean evaluation and check run.

- [ ] **Step 2: Run formatting**

Run: `treefmt -vv`
Expected: Clean format pass across all files.

- [ ] **Step 3: Commit lock file update and formatting**

```bash
git add flake.lock
git commit -m "chore(nix): update flake.lock for blueprint input

Co-authored-by: Gemini 3.6 Flash via Antigravity <noreply@google.com>"
```
