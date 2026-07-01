#!/usr/bin/env bash
# Removes all bin/ and obj/ build output folders under the repository.
# Next build will trigger a fresh restore. Run from anywhere:  ./clean.sh
set -euo pipefail

# Resolve the repo root as the directory containing this script.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Cleaning bin/ and obj/ under: $ROOT"

count=0
while IFS= read -r -d '' dir; do
    rm -rf "$dir"
    echo "  removed: ${dir#"$ROOT"/}"
    count=$((count + 1))
done < <(find "$ROOT" -type d \( -name bin -o -name obj \) -prune -print0)

echo "Done. Removed $count folder(s)."
