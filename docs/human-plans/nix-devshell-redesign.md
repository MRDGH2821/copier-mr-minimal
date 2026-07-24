# Nix Devshell redesign 2026-07-24

Redesign me flake.nix devshell from groundup and integrate as follows.

## Packages

Add this to flake.nix:
<https://github.com/numtide/llm-agents.nix>

And configure the following in it:

1. rtk
2. antigravity-cli
3. copilot-cli
4. cursor-agent
5. opencode
6. apm
7. git-surgeon

Also use the binary cache.

## Formatter

Add this to flake.nix:
<https://github.com/numtide/treefmt-nix>

Create treefmt.nix and enable the given:

1. actionlint
2. alejandra
3. beautysh
4. deadnix
5. djlint
6. dockerfmt
7. dockfmt
8. dos2unix
9. flake-edit
10. genemichaels
11. json-sort-cli
12. just
13. keep-sorted
14. nbstripout
15. nixf-diagnose
16. nixfmt
17. nixpkgs-fmt
18. prettier (point `settingsFile` to .prettierrc.json)
19. ruff-check
20. ruff-format
21. shellcheck
22. shfmt
23. sqlfluff
24. sqlfluff-lint
25. statix
26. taplo
27. toml-sort
28. typos
29. typstyle
30. xmllint
31. yamllint
32. zizmor

Some formatters may not be present, so port them from `.treefmt.toml`

## Git Hooks

Add this to flake.nix:
<https://github.com/cachix/git-hooks.nix>

And migrate `.pre-commit-config.yaml` to git-hooks.nix

## MCP

I want MCP configuration in devshell using the MCP servers Nix module.
So follow the instructions given in - <https://github.com/natsukium/mcp-servers-nix/blob/main/docs/module-usage.md#using-flakes>

Then configure this mcp:

1. <https://github.com/utensils/mcp-nixos>

The target harnesses are:

1. antigravity-cli
2. copilot-cli
3. cursor-agent
4. opencode

## Agent skills

Add this to flake.nix - <https://github.com/Kyure-A/agent-skills-nix>

And configure the following in it:

1. <https://www.skills.sh/github/awesome-copilot/git-commit>

The target harnesses are:

1. antigravity-cli
2. copilot-cli
3. cursor-agent
4. opencode
