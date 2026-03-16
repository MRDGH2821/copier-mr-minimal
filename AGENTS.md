# AGENTS Instructions

This file provides guidance for AI coding assistants working with this project.

## MANDATORY: AI Co-authored-by Trailer

> **Every commit made with AI assistance MUST include a `Co-authored-by` trailer. No exceptions.**

**Format:**

```
Co-authored-by: <Model Name> via <Tool> <noreply@provider-domain>
```

**Provider noreply addresses:**

| Provider                | noreply address         |
| ----------------------- | ----------------------- |
| Anthropic (Claude)      | `noreply@anthropic.com` |
| OpenAI (GPT / o-series) | `noreply@openai.com`    |
| Google (Gemini)         | `noreply@google.com`    |
| Microsoft (Copilot)     | `noreply@microsoft.com` |
| Mistral                 | `noreply@mistral.ai`    |
| Meta (Llama)            | `noreply@meta.com`      |
| xAI (Grok)              | `noreply@x.ai`          |

**Examples:**

```txt
feat(precommit): add spell checking to commit messages

Co-authored-by: Claude Sonnet 4.6 via opencode <noreply@anthropic.com>
```

```txt
fix(cspell): resolve configuration issue

Co-authored-by: GPT-4o via Cursor <noreply@openai.com>
```

**Rules:**

- Use the **exact model name and version** you are running as (e.g. `Claude Sonnet 4.6`, not just `Claude`)
- Use the **tool name** as it is commonly known (e.g. `opencode`, `Cursor`, `Copilot`, `Zed`)
- If the model version is unknown, use the model family name (e.g. `Claude Sonnet`)
- One trailer per AI model involved
- **Never omit this trailer** when the commit was AI-assisted — this is how git history stays honest

## Project Context

- **Project Type**: Template repository for minimal project setup
- **Key Technologies**: pre-commit hooks, MegaLinter, prek
- **Purpose**: Provides a standardized starting point for new projects with quality checks

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
  - Description of what was done
  - Which AI model was used (e.g., Claude Sonnet 4.5, GPT-4, etc.)
- If more prompts are provided on the same day, append them to the existing log file with timestamps
- Use the `date` command to generate timestamps (e.g., `date --iso-8601=seconds` or `date '+%Y-%m-%d %H:%M:%S'`)
- Place any other relevant documents (prompts, examples, references) in the `.agents` folder
- This provides transparency and helps track AI contributions to the project

## Dev Environment Tips

- Use `--help` or `help` subcommand to get help on a command. It can even reveal hints on how to proceed ahead or optimize the number of steps.
- Check tool documentation before asking the user for configuration details

## Pre-commit Hooks (prek)

### Installation

- Install with `uv tool install prek` and enable the hooks with `prek install --install-hooks`
- Hooks run automatically on each commit — no need to run manually

### Working with Hooks

- If a pre-commit hook fails, read the error message carefully - it often suggests the fix
- Some hooks auto-fix issues (like formatters); others require manual intervention

## Linting and Formatting

### MegaLinter

- Configuration is in `.mega-linter.yml`
- Run locally with: `npx mega-linter-runner --flavor documentation`
- Check reports in `megalinter-reports/` directory
- Not all linters need to pass - some are informational

### CSpell (Spell Checking)

- Configuration is in `.cspell.json`
- Add project-specific words to the `words` array
- Don't disable spell checking without good reason
- Both file content and commit messages are spell-checked

### treefmt

- Run `treefmt -vv` before every commit to format all supported file types (markdown, JSON, YAML, etc.)
- Must be run manually — it is not a pre-commit hook

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

- Read the error message carefully - it often suggests the fix
- Fix formatting issues first (treefmt, whitespace)
- Then address spell checking and linting

**Spell check failures:**

- Add legitimate technical terms to `.cspell.json` `words` array
- Use proper capitalization for proper nouns
- Don't add obvious typos to the dictionary

**Template syntax errors:**

- Ensure template syntax is valid before committing
- Check for missing closing tags or brackets
- Test template rendering if applicable

### Getting Help

- Most tools support `--help` flag for detailed usage
- Check tool documentation before modifying configurations
- Review existing configuration files for examples

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
- Update relevant configuration files

### Testing Changes

- Verify the project structure is correct
- Test on a clean environment if possible
- Ensure documentation is updated

## Project Skills

This project includes custom AI agent skills to assist with specific tasks:

| Skill         | Purpose                                                                                                                                                                | Location                                                                   |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| `tool-runner` | Intelligent runtime selection with fallback chains (Bun → Node, bunx → npx). Use when writing shell tasks, package manager commands, or documenting tool availability. | [.agents/skills/tool-runner/SKILL.md](.agents/skills/tool-runner/SKILL.md) |
| `git-commit`  | Conventional Commits enforcement with auto-detection of type/scope, intelligent staging, and commit message generation. Use when creating git commits.                 | [.agents/skills/git-commit/SKILL.md](.agents/skills/git-commit/SKILL.md)   |
| `cocogitto`   | Create and validate Conventional Commits using the `cog` CLI. Covers simple commits, breaking changes, multiline messages, and scope validation via `cog.toml`.        | [.agents/skills/cocogitto/SKILL.md](.agents/skills/cocogitto/SKILL.md)     |
