# Design Document: Integrating numtide/blueprint

## Overview

Split `flake.nix` into modular Nix files as per the [Blueprint Folder Structure documentation](https://numtide.github.io/blueprint/main/getting-started/folder_structure/) using the `prefix = "nix/";` configuration. Further modularize the devshell by splitting MCP configuration and agent skills configuration into dedicated files.

## Directory Structure

```
copier-mr-minimal/
├── flake.nix
├── treefmt.nix
└── nix/
    ├── devshell.nix
    ├── formatter.nix
    ├── mcp.nix
    ├── skills.nix
    └── checks/
        ├── formatting.nix
        └── pre-commit-check.nix
```

## Component Details

### 1. `flake.nix`

- Adds `blueprint.url = "github:numtide/blueprint";` to inputs.
- Delegates output generation to `inputs.blueprint`:
  ```nix
  outputs = inputs: inputs.blueprint {
    inherit inputs;
    prefix = "nix/";
  };
  ```

### 2. `nix/formatter.nix`

- Takes `{ pkgs, inputs, ... }`.
- Evaluates `treefmt-nix` wrapper using `./../treefmt.nix`.

### 3. `nix/checks/formatting.nix`

- Takes `{ pkgs, inputs, flake, ... }`.
- Evaluates `treefmt-nix` check using `./../treefmt.nix` on `flake`.

### 4. `nix/checks/pre-commit-check.nix`

- Takes `{ pkgs, inputs, system, ... }`.
- Evaluates `inputs.git-hooks.lib.${system}.run` with hooks (`treefmt`, `check-merge-conflicts`, `cspell`, `cspell-commit-msg`, `ggshield`, `forbidden-files`, `cocogitto`).

### 5. `nix/mcp.nix`

- Takes `{ pkgs, inputs, ... }`.
- Generates `mcpOpencodeConfig` via `inputs.mcp-servers-nix.lib.mkConfig`.

### 6. `nix/skills.nix`

- Takes `{ pkgs, inputs, ... }`.
- Generates `skillsShellHook` via `inputs.agent-skills.lib.agent-skills`.

### 7. `nix/devshell.nix`

- Takes `{ pkgs, inputs, flake, system, ... }`.
- Imports `mcp.nix` and `skills.nix`.
- Combines pre-commit shell hook, MCP config symlink, and agent skills hook into `pkgs.mkShell`.
