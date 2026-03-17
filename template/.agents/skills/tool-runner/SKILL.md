---
name: tool-runner
description: >
  Intelligent runtime selection with fallback chains for package managers and tools.
  Prioritizes Bun as the primary runtime and bunx as the npx replacement, with graceful
  fallbacks to Node.js/npm when Bun is unavailable.
  Trigger: When running package manager commands, installing dependencies, executing scripts,
  or documenting tool availability in shell tasks.
license: Apache-2.0
metadata:
  author: gentleman-programming
  version: "1.0"
---

# Tool runner

## When to Use

Use this skill when:

- Writing shell tasks or scripts that invoke package managers
- Documenting tool availability checks in Copier templates
- Creating CI/CD pipelines with cross-platform tool support
- Building deployment scripts that shouldn't fail if primary tool is missing
- Generating `.tasks` (dict syntax) with shell guards in `copier.yml`
- Documenting fallback chains for reproducible builds

## Critical Patterns

### 1. The Fallback Chain Philosophy

**Primary → Secondary → Tertiary (with clear messaging)**

```txt
bun → node
bunx → npx → pnpm → npm (in that order)
```

Always check availability BEFORE attempting to run. Use `command -v` (POSIX-compliant, works everywhere).

### 2. Bun as Primary Runtime

Bun is the preferred primary runtime because:

- **Faster**: 4-5x faster package installation than npm
- **Drop-in replacement**: Compatible with Node.js/npm ecosystem
- **Built-in tools**: bunx (like npx), bun test, bun run
- **Zero setup**: Single binary, no separate pkg manager needed

```bash
# Good: Check for bun first, fall back to node
if command -v bun >/dev/null 2>&1; then
  bun run build
else
  npm run build
fi
```

### 3. Package Manager Selection (in order of preference)

| Tool   | Use Case                                        | Fallback |
| ------ | ----------------------------------------------- | -------- |
| `bunx` | Running one-off packages, npm scripts           | → `npx`  |
| `bun`  | Package installation, dependency management     | → `npm`  |
| `pnpm` | Monorepos, workspace projects                   | → `npm`  |
| `npm`  | Universal fallback (always available with Node) | None     |

### 4. Shell Guard Syntax (for Copier `_tasks`)

Use this pattern in `copier.yml` when defining tasks:

```yaml
_tasks:
  build:
    cmd: |
      if command -v bun >/dev/null 2>&1; then
        bun run build
      elif command -v npm >/dev/null 2>&1; then
        npm run build
      else
        echo "ERROR: Neither bun nor npm found. Install Node.js or Bun."
        exit 1
      fi
```

**Why this pattern?**

- `command -v` is POSIX-compliant (works on Linux, macOS, Windows/Git Bash)
- Exits gracefully with a helpful message if tool not found
- Doesn't silently fail or produce confusing errors
- Compatible with `_tasks` (dict syntax) introduced in Copier 9.0+

### 5. Installation Task Guards

For tasks that install dependencies, check BOTH availability and user preference:

```yaml
_tasks:
  install-deps:
    when: "{{ not _copier_conf.quiet }}"
    cmd: |
      if command -v bun >/dev/null 2>&1; then
        echo "📦 Installing with Bun..."
        bun install
      elif command -v pnpm >/dev/null 2>&1; then
        echo "📦 Installing with pnpm..."
        pnpm install
      elif command -v npm >/dev/null 2>&1; then
        echo "📦 Installing with npm..."
        npm install
      else
        echo "⚠️  No package manager found. Skipping dependency installation."
        echo "Install Node.js, Bun, or pnpm to install dependencies."
      fi
```

## Code Examples

### Example 1: Simple npx → bunx check

```bash
# Check for bunx, fall back to npx
RUNNER=$(command -v bunx >/dev/null 2>&1 && echo bunx || echo npx)
$RUNNER prettier --write .
```

### Example 2: Script in package.json with fallback

```json
{
  "scripts": {
    "fmt": "bunx prettier --write .",
    "lint": "bunx eslint .",
    "test": "bunx vitest"
  }
}
```

When user runs `npm run fmt`, npm will execute the script as-is. The shell evaluates `bunx` first; if not found, it fails gracefully.

**Better approach** (make the script itself resilient):

```json
{
  "scripts": {
    "fmt": "sh -c 'command -v bunx >/dev/null 2>&1 && bunx prettier --write . || npx prettier --write .'"
  }
}
```

### Example 3: Copier task with guards (recommended)

```yaml
_min_copier_version: "9.0.0"

project_name:
  type: str
  help: Project name

_tasks:
  fmt:
    when: "{{ not _copier_conf.quiet }}"
    cmd: |
      if command -v bun >/dev/null 2>&1; then
        bun run fmt
      elif command -v npm >/dev/null 2>&1; then
        npm run fmt
      else
        echo "⚠️  SKIP: No package manager found (bun/npm)"
      fi

  test:
    when: "{{ not _copier_conf.quiet }}"
    cmd: |
      if command -v bun >/dev/null 2>&1; then
        bun test
      else
        echo "⚠️  SKIP: bun not found. Install Bun to run tests."
      fi
```

### Example 4: CI/CD Pipeline (GitHub Actions)

```yaml
name: Test

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install Bun
        uses: oven-sh/setup-bun@v1

      - name: Install dependencies
        run: bun install

      - name: Run tests
        run: bun test

      - name: Build
        run: bun run build
```

**Without Bun setup** (fallback to Node):

```yaml
- name: Setup Node
  uses: actions/setup-node@v4
  with:
    node-version: "20"

- name: Install dependencies
  run: npm install

- name: Run tests
  run: npm test
```

## Commands

### Check if tool is available

```bash
# Check single tool
command -v bun >/dev/null 2>&1 && echo "✓ bun found" || echo "✗ bun not found"

# Check multiple tools in sequence
for tool in bun pnpm npm; do
  command -v $tool >/dev/null 2>&1 && echo "✓ $tool found" && break || true
done
```

### Run with fallback

```bash
# One-liner for npx → bunx
command -v bunx >/dev/null 2>&1 && bunx vitest || npx vitest

# Multi-level fallback
bun run test 2>/dev/null || npm test 2>/dev/null || echo "No test runner found"
```

### Install Bun

```bash
# macOS/Linux
curl -fsSL https://bun.sh/install | bash

# Windows (PowerShell)
powershell -c "$(irm bun.sh/install.ps1)"

# Verify installation
bun --version
```

### Copier task with status messaging

```bash
# In a shell script or task
status() {
  if command -v bun >/dev/null 2>&1; then
    echo "✓ Using Bun"
    return 0
  elif command -v npm >/dev/null 2>&1; then
    echo "⚠️  Bun not found, falling back to npm"
    return 0
  else
    echo "✗ ERROR: No package manager found"
    return 1
  fi
}

status || exit 1
```

## Decision Trees

### "Which tool should I recommend for X?"

```txt
Task: Run one-off package/script
  → Use: bunx (if available) or npx
  → Pattern: command -v bunx >/dev/null 2>&1 && bunx ... || npx ...

Task: Install dependencies
  → Use: bun install (if available), else npm install
  → Pattern: Check availability, fall back gracefully

Task: Run defined scripts (in package.json)
  → Use: bun run <script> or npm run <script>
  → Pattern: Shell guards in Copier tasks, not in package.json scripts

Task: CI/CD pipeline
  → Use: setup-bun action if available, else setup-node
  → Pattern: Use primary (Bun) in setup, script handles fallback
```

## Resources

- **[Bun Official Docs](https://bun.sh/)** — Full reference
- **[Bun vs npm Comparison](https://bun.sh/guides)** — Performance, features
- **[POSIX Shell Compatibility](https://pubs.opengroup.org/onlinepubs/9699919799/)** — `command -v` reference
- **[Copier Documentation](https://copier.readthedocs.io/)** — `_tasks` dict syntax (v9.0+)
