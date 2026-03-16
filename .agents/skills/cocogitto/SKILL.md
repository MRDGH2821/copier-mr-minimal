---
name: cocogitto
description: >
  Create and validate Conventional Commits using the cocogitto CLI (cog).
  Trigger: When creating a git commit, writing a commit message, or validating commit history.
license: Apache-2.0
metadata:
  author: gentleman-programming
  version: "1.0"
---

## When to Use

- Creating any git commit in a project that has `cog.toml`
- Validating a commit message before committing
- Checking commit history for spec compliance

## Critical Patterns

### Valid scopes come from `cog.toml`

Always read the `scopes` array in `cog.toml` before choosing a scope. Never hardcode or guess scopes.

```bash
grep -A20 "^scopes" cog.toml
```

### Verify before you commit

Always run `cog verify` on the full message first — catches scope errors, malformed headers, and invalid types before the hook does.

### Multiline commits: two different paths

| Situation                                    | Command                               |
| -------------------------------------------- | ------------------------------------- |
| Header only (no body, no trailers)           | `cog commit`                          |
| Body and/or trailers (e.g. `Co-authored-by`) | `git commit -m` with multiline string |

`cog commit` only accepts a single-line description. It cannot attach a body or footers via CLI args. Use `git commit -m` for those cases.

## Commands

### Simple commit (header only)

```bash
cog commit <type> "<description>" [scope]
```

```bash
cog commit feat "add login endpoint" auth
cog commit fix "handle nil pointer in parser"
cog commit docs "update README examples" cspell
```

### Breaking change

```bash
cog commit feat "redesign configuration API" --breaking-change
```

### Stage all tracked files and commit in one step

```bash
cog commit feat "add dark mode" -u          # git add -u (tracked only)
cog commit feat "add dark mode" -a          # git add .  (all including untracked)
```

### Multiline commit with body and/or trailers

Use `git commit -m` with `$'...'` syntax (ANSI-C quoting — preserves `\n`):

```bash
git commit -m $'feat(auth): add OAuth2 support\n\nIntegrates GitHub and Google providers.\nTokens are stored encrypted at rest.\n\nCo-authored-by: Claude Sonnet 4.6 via opencode <noreply@anthropic.com>'
```

Or a heredoc for readability:

```bash
git commit -m "$(cat <<'EOF'
feat(auth): add OAuth2 support

Integrates GitHub and Google providers.
Tokens are stored encrypted at rest.

Co-authored-by: Claude Sonnet 4.6 via opencode <noreply@anthropic.com>
EOF
)"
```

### Verify a message before committing

```bash
# Inline
cog verify "feat(treefmt): reformat all files"

# Multiline via stdin
printf 'feat(auth): add OAuth2\n\nBody here.\n\nCo-authored-by: Claude Sonnet 4.6 via opencode <noreply@anthropic.com>' | cog verify --file -
```

### Check commit history

```bash
cog check                    # full history
cog check --from-latest-tag  # only since last tag
```

## Workflow

1. **Read scopes** from `cog.toml`
2. **Stage** files (`git add` or use `-a`/`-u` flags)
3. **Choose path**:
   - Header only → `cog commit <type> "<msg>" [scope]`
   - With body/trailers → `git commit -m` multiline
4. **Verify** before running if unsure: `cog verify "<message>"`

## Co-authored-by trailer

This project requires a `Co-authored-by` trailer on every AI-assisted commit. Since `cog commit` cannot attach trailers, always use `git commit -m` when AI is the author:

```bash
git commit -m "$(cat <<'EOF'
feat(cspell): add domain-specific words to dictionary

Added technical terms from the new auth module to prevent
false positives in spell checking.

Co-authored-by: Claude Sonnet 4.6 via opencode <noreply@anthropic.com>
EOF
)"
```
