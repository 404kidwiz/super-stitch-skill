#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"

cd "$repo_root"

pass_count=0
fail_count=0

pass() {
  printf 'PASS %s\n' "$1"
  pass_count=$((pass_count + 1))
}

fail() {
  printf 'FAIL %s\n' "$1" >&2
  fail_count=$((fail_count + 1))
}

check_file() {
  local path="$1"

  if [ -f "$path" ]; then
    pass "$path"
  else
    fail "$path"
  fi
}

check_contains() {
  local path="$1"
  local pattern="$2"
  local label="$3"

  if grep -Fq "$pattern" "$path"; then
    pass "$label"
  else
    fail "$label"
  fi
}

for path in \
  README.md \
  .gitignore \
  .codex/skills/super-stitch-skill/SKILL.md \
  .codex/skills/super-stitch-skill/agents/openai.yaml \
  .codex/skills/super-stitch-skill/references/stitch-studio.md \
  .codex/skills/super-stitch-skill/references/premium-ui-system.md \
  .codex/skills/super-stitch-skill/references/site-clone-loop.md \
  .codex/skills/super-stitch-skill/references/component-handoff.md \
  .codex/skills/super-stitch-skill/references/prompt-template.md \
  .codex/skills/google-stitch-design/SKILL.md \
  scripts/install-super-stitch-skill.sh \
  scripts/verify-super-stitch-skill.sh \
  scripts/install-google-stitch-design.sh \
  scripts/verify-google-stitch-design.sh \
  scripts/validate-repo.sh \
  examples/README.md \
  examples/clone-reference.md \
  examples/redesign-after-clone.md \
  examples/code-handoff.md \
  .github/workflows/validate.yml
do
  check_file "$path"
done

check_contains ".codex/skills/super-stitch-skill/SKILL.md" "name: super-stitch-skill" "super-stitch-skill frontmatter"
check_contains ".codex/skills/super-stitch-skill/agents/openai.yaml" "display_name: \"Super Stitch Skill\"" "agents metadata display name"
check_contains "README.md" "super-stitch-skill/actions/workflows/validate.yml" "README badge link"
check_contains "README.md" '```mermaid' "README mermaid diagram"
check_contains "README.md" "examples/clone-reference.md" "README examples link"

for script in \
  scripts/install-super-stitch-skill.sh \
  scripts/verify-super-stitch-skill.sh \
  scripts/install-google-stitch-design.sh \
  scripts/verify-google-stitch-design.sh \
  scripts/validate-repo.sh
do
  if bash -n "$script"; then
    pass "bash -n $script"
  else
    fail "bash -n $script"
  fi
done

printf '\nPass: %s\n' "$pass_count"
printf 'Fail: %s\n' "$fail_count"

if [ "$fail_count" -gt 0 ]; then
  exit 1
fi
