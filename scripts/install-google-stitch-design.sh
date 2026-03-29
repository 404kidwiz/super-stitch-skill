#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"

skill_name="google-stitch-design"
source_dir="$repo_root/.codex/skills/$skill_name"
shared_skill_root="${SKILL_SHARED_ROOT:-$HOME/.gemini/antigravity/skills}"
target_dir="$shared_skill_root/$skill_name"
timestamp="$(date +%Y%m%d%H%M%S)"

backup_existing_target() {
  if [ ! -e "$target_dir" ] && [ ! -L "$target_dir" ]; then
    return 0
  fi

  backup_path="${target_dir}.bak.${timestamp}"
  mv "$target_dir" "$backup_path"
  echo "Backed up existing target to: $backup_path"
}

if [ ! -d "$source_dir" ]; then
  echo "Source skill not found: $source_dir" >&2
  exit 1
fi

mkdir -p "$shared_skill_root"

if [ -L "$target_dir" ]; then
  current_link="$(readlink "$target_dir" || true)"
  if [ "$current_link" = "$source_dir" ]; then
    echo "Skill already linked at: $target_dir"
    exit 0
  fi

  backup_existing_target
elif [ -e "$target_dir" ] && [ ! -d "$target_dir" ]; then
  backup_existing_target
fi

if [ -d "$target_dir" ]; then
  rsync -a --delete "$source_dir"/ "$target_dir"/
else
  mkdir -p "$target_dir"
  rsync -a "$source_dir"/ "$target_dir"/
fi

if command -v gemini >/dev/null 2>&1; then
  gemini skills link "$source_dir" --consent >/dev/null
  echo "Registered with Gemini via skills link."
fi

echo "Installed $skill_name to: $target_dir"
echo "Shared root: $shared_skill_root"
