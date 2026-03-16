# Copier Template with tool-runner Integration

This example shows how to integrate `tool-runner` patterns into a `copier.yml` template.

## Basic Pattern: Shell Guards in `_tasks`

```yaml
_min_copier_version: "9.0.0"

project_name:
  type: str
  help: Project name
  default: my-project

_tasks:
  install-deps:
    when: "{{ not _copier_conf.quiet }}"
    cmd: |
      if command -v bun >/dev/null 2>&1; then
        echo "📦 Installing with Bun..."
        bun install
      elif command -v npm >/dev/null 2>&1; then
        echo "📦 Installing with npm..."
        npm install
      else
        echo "⚠️  SKIP: No package manager found (requires Node.js or Bun)"
      fi

  format:
    when: "{{ not _copier_conf.quiet }}"
    cmd: |
      if command -v bun >/dev/null 2>&1; then
        bun run fmt
      elif command -v npx >/dev/null 2>&1; then
        npx prettier --write .
      else
        echo "⚠️  SKIP: Formatting requires bun or npx"
      fi

  lint:
    when: "{{ not _copier_conf.quiet }}"
    cmd: |
      if command -v bun >/dev/null 2>&1; then
        bun run lint
      else
        echo "⚠️  SKIP: Linting requires bun (run 'npm run lint' manually)"
      fi
```

## Advanced Pattern: Shared Helper Function

Create `template/_tasks_helper.sh`:

```bash
#!/usr/bin/env bash
# Helper functions for tool selection

find_runner() {
    local primary=$1
    local secondary=$2

    if command -v "$primary" >/dev/null 2>&1; then
        echo "$primary"
    elif command -v "$secondary" >/dev/null 2>&1; then
        echo "$secondary"
    else
        return 1
    fi
}

run_or_skip() {
    local tool=$1
    shift

    if ! runner=$(find_runner "$tool" "${FALLBACK_TOOL:-npm}"); then
        echo "⚠️  SKIP: $tool not found"
        return 0
    fi

    echo "→ Using $runner"
    "$runner" "$@"
}
```

Then in `copier.yml`:

```yaml
_tasks:
  setup:
    when: "{{ not _copier_conf.quiet }}"
    cmd: |
      . template/_tasks_helper.sh
      run_or_skip bun install
```

## Guiding Principle

**Always check, never assume.** Users may have different setups:

- Some only have Node.js installed
- Some have Bun but prefer npm for portability
- Some use pnpm in monorepos
- Some don't want anything installed after generation

The `when` clause respects the user's quiet mode preference, and the task itself gracefully handles missing tools.
