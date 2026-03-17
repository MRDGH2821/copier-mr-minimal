#!/usr/bin/env bash
# tool-runner.sh - Intelligent tool runner with fallback support
#
# Usage:
#   ./tool-runner.sh npx prettier --write .
#   ./tool-runner.sh npm run build
#   ./tool-runner.sh bun install
#
# This script will:
#   - Translate npx → bunx if available, else npx
#   - Translate npm → bun if available, else npm
#   - Exit with clear error messages if tool not found

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Tool selection logic
select_runner() {
	local tool=$1

	case $tool in
	npx)
		if command -v bunx >/dev/null 2>&1; then
			echo "bunx"
		elif command -v npx >/dev/null 2>&1; then
			echo "npx"
		else
			echo "ERROR: Neither bunx nor npx found" >&2
			return 1
		fi
		;;
	npm)
		if command -v bun >/dev/null 2>&1; then
			echo "bun"
		elif command -v npm >/dev/null 2>&1; then
			echo "npm"
		else
			echo "ERROR: Neither bun nor npm found" >&2
			return 1
		fi
		;;
	bun)
		if command -v bun >/dev/null 2>&1; then
			echo "bun"
		else
			echo "ERROR: bun not found" >&2
			return 1
		fi
		;;
	*)
		echo "$tool"
		;;
	esac
}

main() {
	if [[ $# -eq 0 ]]; then
		echo "Usage: $0 <tool> [args...]"
		echo ""
		echo "Examples:"
		echo "  $0 npx prettier --write ."
		echo "  $0 npm run build"
		echo "  $0 bun install"
		exit 1
	fi

	local tool=$1
	shift

	echo -e "${YELLOW}→${NC} Resolving tool: ${YELLOW}${tool}${NC}"

	local runner
	if ! runner=$(select_runner "$tool"); then
		echo -e "${RED}✗ Failed to select runner${NC}"
		exit 1
	fi

	if [[ "$runner" != "$tool" ]]; then
		echo -e "${GREEN}✓${NC} Using ${GREEN}${runner}${NC} (fallback from ${YELLOW}${tool}${NC})"
	else
		echo -e "${GREEN}✓${NC} Using ${GREEN}${runner}${NC}"
	fi

	echo -e "${YELLOW}→${NC} Running: ${GREEN}${runner}${NC} ${GREEN}$*${NC}"
	echo ""

	"$runner" "$@"
}

main "$@"
