# Nix Devshell Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Redesign flake.nix devshell from the ground up, integrating llm-agents.nix, treefmt-nix, git-hooks.nix, mcp-servers-nix, and agent-skills-nix across all target harnesses.

**Architecture:** Update flake.nix inputs and outputs, build a comprehensive treefmt.nix configuration, migrate pre-commit hooks to git-hooks.nix, set up multi-harness MCP configs with mcp-servers-nix, and configure agent-skills-nix to install awesome-copilot git-commit skill to target harnesses.

**Tech Stack:** Nix Flakes, treefmt-nix, git-hooks.nix, mcp-servers-nix, agent-skills-nix, llm-agents.nix.

## Global Constraints

- Follow Conventional Commits format with valid scopes in cog.toml.
- Always include `Co-authored-by: Gemini 3.6 Flash via Antigravity <noreply@google.com>` trailer on git commits.
- Document AI activities in `.agents/logs/2026-07-24.md`.
- Run `treefmt -vv` before committing changes.

---

### Task 1: Comprehensive treefmt.nix Configuration

**Files:**

- Modify: `treefmt.nix`

- [ ] **Step 1: Update treefmt.nix with 32 requested programs and custom formatters**

Enable all 32 programs requested in `nix-devshell-redesign.md`:
`actionlint`, `alejandra`, `beautysh`, `deadnix`, `djlint`, `dockerfmt`, `dockfmt`, `dos2unix`, `flake-edit`, `genemichaels`, `json-sort-cli`, `just`, `keep-sorted`, `nbstripout`, `nixf-diagnose`, `nixfmt`, `nixpkgs-fmt`, `prettier` (`settingsFile = ".prettierrc.json"`), `ruff-check`, `ruff-format`, `shellcheck`, `shfmt`, `sqlfluff`, `sqlfluff-lint`, `statix`, `taplo`, `toml-sort`, `typos`, `typstyle`, `xmllint`, `yamllint`, `zizmor`. Also retain custom formatters (`cspell-sort`, `ignore-files-formatter`, `prettypst-default`, `prettypst-otbs`, `sort-markdown-tables`, `sort-package-json`, `tombi-format`, `yamlfix`, `yq-key-sort`).

- [ ] **Step 2: Test treefmt evaluation**

Run: `nix eval .#formatter.x86_64-linux`
Expected: Derivation evaluates cleanly without syntax errors.

- [ ] **Step 3: Commit Task 1 changes**

Run: `treefmt -vv && git add treefmt.nix && git commit -m "feat(treefmt): enable all 32 programs and custom formatters in treefmt.nix"`

---

### Task 2: Flake Inputs & Outputs Integration (llm-agents, git-hooks, mcp-servers, agent-skills)

**Files:**

- Modify: `flake.nix`
- Modify: `cog.toml`

- [ ] **Step 1: Update cog.toml scopes if needed**

Add `"nix"` to valid scopes in `cog.toml`.

- [ ] **Step 2: Update flake.nix with llm-agents binary cache, llm-agents packages, git-hooks, mcp-servers-nix, agent-skills-nix**

Configure:

1. `nixConfig` for `llm-agents.nix` binary cache (`https://cache.numtide.com`).
2. `llm-agents` packages: `rtk`, `antigravity-cli`, `copilot-cli`, `cursor-agent`, `opencode`, `apm`, `git-surgeon`.
3. `git-hooks.nix` migrating `.pre-commit-config.yaml` (`treefmt`, `check-merge-conflicts`, `cspell`, `ggshield`, `forbidden-files`, `cocogitto`).
4. `mcp-servers-nix` for target harnesses (`antigravity-cli`, `copilot-cli`, `cursor-agent`, `opencode`) with `mcp-nixos` enabled.
5. `agent-skills-nix` for `awesome-copilot` `git-commit` skill targeting `antigravity-cli`, `copilot-cli`, `cursor-agent`, `opencode`.

- [ ] **Step 3: Test nix flake check and devshell evaluation**

Run: `nix flake check && nix develop --command echo "Devshell loaded successfully"`
Expected: Flake evaluates and devshell opens without error.

- [ ] **Step 4: Commit Task 2 changes**

Run: `treefmt -vv && git add flake.nix cog.toml && git commit -m "feat(nix): redesign flake devshell with llm-agents, git-hooks, mcp, and agent-skills"`

---

### Task 3: Verification and AI Log Documentation

**Files:**

- Modify: `.agents/logs/2026-07-24.md`

- [ ] **Step 1: Test devshell hooks, MCP configs, and skill targets**

Run: `nix develop --command bash -c "ls -la .mcp.json opencode.json .vscode/mcp.json .agent/skills .github/skills .cursor/skills .opencode/skills"`
Expected: All generated config symlinks and skill directories exist.

- [ ] **Step 2: Write AI log documentation**

Create/update `.agents/logs/2026-07-24.md` with prompt, AI model used, timestamps, and description of changes.

- [ ] **Step 3: Commit Task 3 changes**

Run: `treefmt -vv && git add .agents/logs/2026-07-24.md && git commit -m "docs: add AI activity log for nix devshell redesign"`