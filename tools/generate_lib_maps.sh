#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LIB_ROOT="${ROOT_DIR}/lib"
DISCOVERY_ROOT="${ROOT_DIR}/.discovery/libraries"

mkdir -p "${DISCOVERY_ROOT}"

echo "Scanning lib/ under ${ROOT_DIR} to generate CODEBASE_MAP.md files in ${DISCOVERY_ROOT}..."

# Function to create CODEBASE_MAP.md for a given directory
generate_map_for_dir() {
  local dir="$1"                # absolute path to directory
  local rel="${dir#${LIB_ROOT}/}"
  local dest_dir="${DISCOVERY_ROOT}/lib/${rel}"
  mkdir -p "${dest_dir}"

  # Collect immediate subdirectories and files
  local subdirs=()
  local files=()
  shopt -s nullglob
  for entry in "$dir"/*; do
    [ -e "$entry" ] || continue
    if [ -d "$entry" ]; then
      subdirs+=("$(basename "$entry")")
    elif [ -f "$entry" ]; then
      files+=("$(basename "$entry")")
    fi
  done

  # Compose map
  {
    echo "# CODEBASE MAP for lib/${rel}"
    echo
    if [ "${#subdirs[@]}" -gt 0 ]; then
      echo "Subdirectories:"
      for s in "${subdirs[@]}"; do
        echo "- $s"
      done
    else
      echo "Subdirectories: None"
    fi
    echo
    if [ "${#files[@]}" -gt 0 ]; then
      echo "Files:"
      for f in "${files[@]}"; do
        echo "- $f"
      done
    else
      echo "Files: None"
    fi
  } > "${dest_dir}/CODEBASE_MAP.md"
}

export -f generate_map_for_dir

# Traverse lib/ and generate maps for dirs that contain at least one subdirectory
while IFS= read -r -d '' dir; do
  has_subdir=false
  for entry in "$dir"/*; do
    if [ -d "$entry" ]; then
      has_subdir=true
      break
    fi
  done
  if [ "$has_subdir" = true ]; then
    generate_map_for_dir "$dir"
  fi
done < <(find "${LIB_ROOT}" -type d -print0)

echo "Done generation. CODEBASE_MAP.md files created under .discovery/libraries."
