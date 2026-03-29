#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
shared_skill_root="${SKILL_SHARED_ROOT:-$HOME/.gemini/antigravity/skills}"
timestamp="$(date +%Y%m%d%H%M%S)"

install_one() {
  local skill_name="$1"
  local source_dir="$repo_root/.codex/skills/$skill_name"
  local target_dir="$shared_skill_root/$skill_name"

  if [ ! -d "$source_dir" ]; then
    echo "Source skill not found: $source_dir" >&2
    return 1
  fi

  mkdir -p "$shared_skill_root"

  if [ -L "$target_dir" ]; then
    local current_link
    current_link="$(readlink "$target_dir" || true)"
    if [ "$current_link" = "$source_dir" ]; then
      echo "Skill already linked at: $target_dir"
      return 0
    fi

    mv "$target_dir" "${target_dir}.bak.${timestamp}"
  elif [ -e "$target_dir" ] && [ ! -d "$target_dir" ]; then
    mv "$target_dir" "${target_dir}.bak.${timestamp}"
  fi

  if [ -d "$target_dir" ]; then
    rsync -a --delete "$source_dir"/ "$target_dir"/
  else
    mkdir -p "$target_dir"
    rsync -a "$source_dir"/ "$target_dir"/
  fi

  if command -v gemini >/dev/null 2>&1; then
    gemini skills link "$source_dir" --consent >/dev/null
    echo "Registered with Gemini via skills link: $skill_name"
  fi

  echo "Installed $skill_name to: $target_dir"
}

install_one "super-stitch-skill"

if [ -d "$repo_root/.codex/skills/google-stitch-design" ]; then
  install_one "google-stitch-design"
fi

echo "Shared root: $shared_skill_root"
