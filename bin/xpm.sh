#!/usr/bin/env bash

set -e

detect_package_manager() {
  local dir="$PWD"

  # Walk up the directory tree looking for lock files
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/pnpm-lock.yaml" ]]; then
      echo "pnpm"
      return
    elif [[ -f "$dir/yarn.lock" ]]; then
      echo "yarn"
      return
    elif [[ -f "$dir/package-lock.json" ]]; then
      echo "npm"
      return
    fi
    dir=$(dirname "$dir")
  done

  # Default to npm if no lock file found
  echo "npm"
}

main() {
  local pm
  pm=$(detect_package_manager)

  # Check if the package manager is available
  if ! command -v "$pm" &> /dev/null; then
    echo "Error: $pm is not installed" >&2
    exit 1
  fi

  # Log which package manager is being used
  echo "Using $pm" >&2

  # Execute the package manager with all provided arguments
  exec "$pm" "$@"
}

main "$@"
