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

| Situation                                           | Command                                          |
| --------------------------------------------------- | ------------------------------------------------ |
| Header only (no body, no trailers)                  | `cog commit <type> "<msg>" [scope]`              |
| Trailers only (e.g. `Co-authored-by`, no body text) | `cog commit` with `$'...\n\ntrailer'` in MESSAGE |
| Body text + trailers (prose paragraphs)             | `git commit -m` heredoc                          |

`cog commit`'s `MESSAGE` argument accepts a multiline string via `$'...'` ANSI-C quoting. A blank line (`\n\n`) separates the subject from the footer — `cog verify` and git both accept this. Use `git commit -m` heredoc only when you need a prose body paragraph.

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

### Trailers only (no prose body) — use `cog commit` with `$'...'`

Use ANSI-C quoting to embed a blank line and trailer inside the `MESSAGE` arg:

```bash
cog commit feat $'add OAuth2 support\n\nCo-authored-by: Claude Sonnet 4.6 via opencode <noreply@anthropic.com>' auth
```

The `\n\n` creates a blank line between the subject and the footer — standard git trailer format. `cog verify` accepts this.

### Body text + trailers — use `git commit -m` heredoc

When you have a prose body (multiple paragraphs of explanation), `git commit -m` heredoc is cleaner:

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
   - Trailers only (e.g. `Co-authored-by`) → `cog commit` with `$'...\n\ntrailer'`
   - Body text + trailers → `git commit -m` heredoc
4. **Verify** before running if unsure: `cog verify "<message>"`

## Co-authored-by trailer

This project requires a `Co-authored-by` trailer on every AI-assisted commit.

**Preferred: `cog commit` with `$'...'` (trailers only)**

```bash
cog commit feat $'add login endpoint\n\nCo-authored-by: Claude Sonnet 4.6 via opencode <noreply@anthropic.com>' auth
```

**Alternative: `git commit -m` heredoc (when you also have a prose body)**

```bash
git commit -m "$(cat <<'EOF'
feat(cspell): add domain-specific words to dictionary

Added technical terms from the new auth module to prevent
false positives in spell checking.

Co-authored-by: Claude Sonnet 4.6 via opencode <noreply@anthropic.com>
EOF
)"
```
