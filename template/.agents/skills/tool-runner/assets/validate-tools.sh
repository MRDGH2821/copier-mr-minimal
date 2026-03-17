#!/usr/bin/env bash
# Validation script for tool-runner patterns
# Tests that fallback logic works correctly

set -euo pipefail

# ANSI colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

TESTS_PASSED=0
TESTS_FAILED=0

test_command() {
	local name=$1
	local cmd=$2
	local should_succeed=$3

	echo -ne "${BLUE}→${NC} Testing: ${name} ... "

	if eval "${cmd}" >/dev/null 2>&1; then
		if [[ "${should_succeed}" == "true" ]]; then
			echo -e "${GREEN}✓ PASS${NC}"
			((TESTS_PASSED++))
		else
			echo -e "${RED}✗ FAIL${NC} (expected to fail but succeeded)"
			((TESTS_FAILED++))
		fi
	else
		if [[ "${should_succeed}" == "false" ]]; then
			echo -e "${GREEN}✓ PASS${NC} (correctly failed)"
			((TESTS_PASSED++))
		else
			echo -e "${RED}✗ FAIL${NC} (expected to succeed but failed)"
			((TESTS_FAILED++))
		fi
	fi
}

echo -e "${YELLOW}═══════════════════════════════════════════════════════════${NC}"
echo -e "${YELLOW}Tool Runner Validation Tests${NC}"
echo -e "${YELLOW}═══════════════════════════════════════════════════════════${NC}"
echo ""

# Test 1: Check tool availability
echo -e "${BLUE}Test Group: Tool Availability Checks${NC}"
test_command "command -v finds bash" "command -v bash >/dev/null 2>&1" "true"
test_command "command -v rejects nonexistent" "command -v nonexistent-tool-xyz >/dev/null 2>&1" "false"

echo ""

# Test 2: Fallback patterns
echo -e "${BLUE}Test Group: Fallback Patterns${NC}"

# bunx or npx (one should always be true with proper Node setup)
test_command "bunx or npx available" \
	"command -v bunx >/dev/null 2>&1 || command -v npx >/dev/null 2>&1" \
	"true"

# bun or npm (npm should always be with Node)
test_command "bun or npm available" \
	"command -v bun >/dev/null 2>&1 || command -v npm >/dev/null 2>&1" \
	"true"

echo ""

# Test 3: Specific tool detection
echo -e "${BLUE}Test Group: Specific Tools${NC}"

if command -v bun >/dev/null 2>&1; then
	echo -e "${GREEN}✓ bun found${NC}"
	((TESTS_PASSED++))
	test_command "bun --version works" "bun --version" "true"
else
	echo -e "${YELLOW}⊘ bun not installed (optional)${NC}"
fi

if command -v npm >/dev/null 2>&1; then
	echo -e "${GREEN}✓ npm found${NC}"
	((TESTS_PASSED++))
	test_command "npm --version works" "npm --version" "true"
else
	echo -e "${RED}✗ npm not found (required for Node.js)${NC}"
	((TESTS_FAILED++))
fi

if command -v npx >/dev/null 2>&1; then
	echo -e "${GREEN}✓ npx found${NC}"
	((TESTS_PASSED++))
else
	echo -e "${YELLOW}⊘ npx not installed (requires npm)${NC}"
fi

echo ""

# Summary
echo -e "${YELLOW}═══════════════════════════════════════════════════════════${NC}"
echo -e "Passed: ${GREEN}${TESTS_PASSED}${NC}"
echo -e "Failed: ${RED}${TESTS_FAILED}${NC}"
echo -e "${YELLOW}═══════════════════════════════════════════════════════════${NC}"

if [[ ${TESTS_FAILED} -gt 0 ]]; then
	echo -e "${RED}Some tests failed. Check your tool installation.${NC}"
	exit 1
else
	echo -e "${GREEN}All critical tests passed!${NC}"
	exit 0
fi
