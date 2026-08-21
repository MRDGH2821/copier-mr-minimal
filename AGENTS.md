# AGENTS Instructions

This file provides guidance for AI coding assistants working with this project.

## MANDATORY: AI Co-authored-by Trailer

> **Every commit made with AI assistance MUST include a `Co-authored-by` trailer. No exceptions.**

**Format:**

```txt
Co-authored-by: <Model Name> via <Tool> <noreply@provider-domain>
```

**Provider noreply addresses:**

<!-- smt -->

| Provider                | noreply address          |
| ----------------------- | ------------------------ |
| Anthropic (Claude)      | `noreply@anthropic.com`  |
| Cursor                  | `cursoragent@cursor.com` |
| Google (Gemini)         | `noreply@google.com`     |
| Meta (Llama)            | `noreply@meta.com`       |
| Microsoft (Copilot)     | `noreply@microsoft.com`  |
| Mistral                 | `noreply@mistral.ai`     |
| OpenAI (GPT / o-series) | `noreply@openai.com`     |
| xAI (Grok)              | `noreply@x.ai`           |

If a provider is not listed above, use the provider's official noreply address.
Multiple co-authors can be listed by repeating the `Co-authored-by` line for each author.

**Examples:**

```txt
feat(precommit): add spell checking to commit messages

Co-authored-by: Claude Sonnet 4.6 via opencode <noreply@anthropic.com>
```

```txt
fix(cspell): resolve configuration issue

Co-authored-by: Composer via Cursor <cursoragent@cursor.com>
```

**Rules:**

- Use the **exact model name and version** you are running as (e.g. `Claude Sonnet 4.6`, not just `Claude`)
- Use the **tool name** as it is commonly known (e.g. `opencode`, `Cursor`, `Copilot`, `Zed`)
- If the model version is unknown, use the model family name (e.g. `Claude Sonnet`)
- One trailer per AI model involved
- **Never omit this trailer** when the commit was AI-assisted — this is how git history stays honest

## Setup: skills and MCP

Before substantive work, ensure project skills and MCP servers are installed.

1. From the repository root, run either:

   ```sh
   apm install
   ```

   or, if `apm` is not on `PATH`:

   ```sh
   uvx --from apm-cli apm install
   ```

2. **Reload the agent** (new chat / restart the agent session) so installed skills and MCP servers are picked up.

Configuration lives in `apm.yml`. Do not skip this when skills or MCP tools are missing or stale.

## Project Context

- **Project Type**: Copier template for minimal project setup
- **Key Technologies**: Nix flake + [Blueprint](https://numtide.github.io/blueprint/) (`nix/`), git-hooks.nix with `prek`, MegaLinter, treefmt-nix, cocogitto, Copier, direnv
- **Purpose**: Standardized starting point for new projects with quality checks and a reproducible Nix env

## Branch naming strategy

Since many people will be contributing to this repository, we use a branching strategy that allows for parallel development while keeping the main branch stable.

Use the following branching strategy:

`<human first name>/<work type>/<work name>`

For example:

- `john/feat/add-packages`
- `jane/fix/ui-bugs`
- `joy/refactor/payment`

`<human first name>` - will be derived from `git config user.name` or the author's first name. Ask the author for their first name if it's not available.
`<work type>` - the type of work being done (e.g., `feat`, `fix`, `refactor`). Should match commit types from conventional commits.
`<work name>` - the name of the work being done (e.g., `add-packages`, `ui-bugs`, `payment`)

## General Guidelines

### Communication

- Explain what you're doing and why before making changes
- Ask for clarification when requirements are ambiguous
- Provide context for decisions, especially when multiple approaches exist

### Code Quality

- Follow existing code style and conventions in the project
- Run linters and formatters before committing changes
- Ensure all changes pass pre-commit hooks

### File Operations

- Always check if a file exists before attempting to modify it
- Use appropriate tools to search for files rather than guessing paths
- Preserve file formatting and structure unless explicitly asked to change it

### AI-Assisted Work Documentation

- Document all AI-assisted changes in the `.agents/logs` folder as markdown files
- Use the naming format: `YYYY-MM-DD.md` (e.g., `2024-12-15.md`)
- Each documentation file should include:
  - The prompt or request that initiated the work
  - The **prompter** name, placed immediately below the prompt — take it from `git config user.name`, or ask the user if that is empty/unavailable
  - Description of what was done
  - Which AI model was used (e.g., Claude Sonnet 4.5, GPT-4, etc.)
- If more prompts are provided on the same day, append them to the existing log file with timestamps
- Use the `date` command to generate timestamps (e.g., `date --iso-8601=seconds` or `date '+%Y-%m-%d %H:%M:%S'`)
- Place any other relevant documents (prompts, examples, references) in the `.agents` folder
- This provides transparency and helps track AI contributions to the project

## Dev Environment

- Enter the env with **direnv** (`.envrc` uses `use flake` and watches `nix/`) or `nix develop`
- Prefer Blueprint args in Nix files: `flake` (shorthand for `inputs.self`), `perSystem`, `pkgs`, `system`
- Consume same-flake packages via `perSystem.self.<name>` (e.g. `perSystem.self.formatter.check`) instead of path-importing Blueprint-loaded files
- Flake layout lives under `nix/` (`formatter.nix`, `devshell.nix`, `checks/`, `modules/`)
- Use `--help` or a `help` subcommand before asking the user for tool details

## Linting and Formatting

### MegaLinter

- Configuration is in `.mega-linter.yml`
- Run locally with: `bunx mega-linter-runner`
- Check reports in `megalinter-reports/` directory
- Not all linters need to pass — some are informational

### CSpell (Spell Checking)

- Configuration is in `.cspell.json`
- Add project-specific words to the `words` array
- Don't disable spell checking without good reason
- Both file content and commit messages are spell-checked

### treefmt / `nix fmt`

- Format with `nix fmt` (Blueprint + treefmt-nix wrapper from `nix/formatter.nix`)
- Verify with `nix flake check` (includes the formatting check)
- Config modules live under `nix/modules/tools/treefmt.nix` (plus imported pedantix/smt modules)

## Commit Messages

### Format

- Follow Conventional Commits format: `<type>(<scope>): <description>` as given here - <https://www.conventionalcommits.org/en/v1.0.0/>
- Valid types: `build`, `chore`, `ci`, `docs`, `feat`, `fix`, `perf`, `refactor`, `revert`, `style`, `test`
- For valid scopes, refer to the `scopes` array in `cog.toml` — it is the source of truth.

### Examples

```txt
feat(precommit): add spell checking to commit messages
fix(cspell): resolve configuration issue
docs: update AGENTS.md with guidelines
chore(cspell): add technical terms to dictionary
```

## Troubleshooting

### Common Issues

**Pre-commit hooks failing on commit:**

- Read the error message — it usually points directly to the fix
- Try to fix the issue and retry the commit; do not skip hooks
- Fix formatting with `nix fmt` first, then spell checking and linting
- Hooks are managed via git-hooks.nix / `prek` (see `nix/checks/pre-commit-check.nix`)

**Spell check failures:**

- Add legitimate technical terms to `.cspell.json` `words` array
- Use proper capitalization for proper nouns
- Don't add obvious typos to the dictionary

**Template / Copier issues:**

- Ensure template syntax is valid before committing
- Check for missing closing tags or brackets
- Test template rendering if applicable (`copier copy` / `copier update`)

**Missing skills or MCP tools:**

- Run `apm install` or `uvx --from apm-cli apm install`, then reload the agent

### Getting Help

- Review existing configuration files for examples
- Blueprint folder layout: <https://numtide.github.io/blueprint/main/getting-started/folder_structure/>

## Best Practices

### Before Making Changes

1. Understand the current state of the project
2. Check if similar functionality already exists
3. Review relevant configuration files
4. Consider impact on users who will use this template

### When Adding Dependencies

- Prefer tools that don't require heavy installation
- Document installation steps clearly
- Consider cross-platform compatibility
- Update relevant configuration files (flake inputs, `apm.yml`, Copier excludes as needed)

### Testing Changes

- Verify the project structure is correct
- Prefer `nix flake check` where Nix is involved
- Test on a clean environment if possible
- Ensure documentation is updated
