#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ZIP="/tmp/kunpo-export-clean.zip"

cd "$ROOT"
echo "Exporting Mintlify site..."
mintlify export --output "$ZIP"

rm -rf "$ROOT/kunpo-api-docs-export"
unzip -q "$ZIP" -d "$ROOT/kunpo-api-docs-export"
cp "$ZIP" "$ROOT/kunpo-api-docs-export.zip"

bash "$ROOT/scripts/post-export.sh"

echo "Done: $ROOT/kunpo-api-docs-export.zip"
