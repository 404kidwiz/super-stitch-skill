#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"

skill_name="google-stitch-design"
source_dir="$repo_root/.codex/skills/$skill_name"
shared_skill_root="${SKILL_SHARED_ROOT:-$HOME/.gemini/antigravity/skills}"

gemini_skill_path="$HOME/.gemini/skills/$skill_name/SKILL.md"
claude_skill_path="$HOME/.claude/skills/$skill_name/SKILL.md"
codex_skill_path="$HOME/.codex/skills/$skill_name/SKILL.md"
opencode_skill_path="$HOME/.config/opencode/skills/$skill_name/SKILL.md"

pass_count=0
fail_count=0
skip_count=0

pass() {
  printf 'PASS %s\n' "$1"
  pass_count=$((pass_count + 1))
}

fail() {
  printf 'FAIL %s\n' "$1" >&2
  fail_count=$((fail_count + 1))
}

skip() {
  printf 'SKIP %s\n' "$1"
  skip_count=$((skip_count + 1))
}

check_file() {
  local label="$1"
  local path="$2"

  if [ -f "$path" ]; then
    pass "$label -> $path"
  else
    fail "$label missing -> $path"
  fi
}

check_prompt_output() {
  local label="$1"
  local output="$2"
  local expected="$3"

  if printf '%s\n' "$output" | grep -Fq "$expected"; then
    pass "$label"
  else
    fail "$label (got: $output)"
  fi
}

expected_answer="references/site-clone-loop.md"
smoke_prompt="Use the google-stitch-design skill. What is the third item under \"Read In This Order\"? Reply with only the relative file path."

check_file "Source skill" "$source_dir/SKILL.md"
check_file "Gemini skill path" "$gemini_skill_path"
check_file "Claude skill path" "$claude_skill_path"
check_file "Codex skill path" "$codex_skill_path"
check_file "OpenCode skill path" "$opencode_skill_path"

gemini_enable_output="$(gemini skills enable "$skill_name" 2>&1 || true)"
if printf '%s\n' "$gemini_enable_output" | grep -Fq "already enabled"; then
  pass "Gemini reports $skill_name is enabled"
else
  fail "Gemini did not confirm $skill_name is enabled (got: $gemini_enable_output)"
fi

gemini_output="$(gemini -p "$smoke_prompt" 2>&1 || true)"
check_prompt_output "Gemini smoke test" "$gemini_output" "$expected_answer"

claude_output="$(claude -p $'/google-stitch-design\nWhat is the third item under "Read In This Order"? Reply with only the relative file path.' 2>&1 || true)"
check_prompt_output "Claude smoke test" "$claude_output" "$expected_answer"

codex_output="$(codex exec -C "$repo_root" "$smoke_prompt" 2>&1 || true)"
check_prompt_output "Codex smoke test" "$codex_output" "$expected_answer"

opencode_output="$(perl -e 'alarm 90; exec @ARGV' opencode run "$smoke_prompt" 2>&1 || true)"
if printf '%s\n' "$opencode_output" | grep -Eqi 'quota exceeded|billing|plan and billing'; then
  skip "OpenCode smoke test blocked by provider quota"
else
  check_prompt_output "OpenCode smoke test" "$opencode_output" "$expected_answer"
fi

printf '\nShared root: %s\n' "$shared_skill_root"
printf 'Pass: %s\n' "$pass_count"
printf 'Fail: %s\n' "$fail_count"
printf 'Skip: %s\n' "$skip_count"

if [ "$fail_count" -gt 0 ]; then
  exit 1
fi
