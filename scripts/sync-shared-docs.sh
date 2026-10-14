#!/bin/bash
# Plugins are installed as self-contained copies, so each domain plugin carries its own copy
# of the shared docs. The source of truth is plugins/find-anything/docs. Run after editing them.
set -e
cd "$(dirname "$0")/.."
for p in plugins/find-cars; do
  cp plugins/find-anything/docs/collaboration.md "$p/docs/collaboration.md"
  cp plugins/find-anything/docs/browsing-rules.md "$p/docs/browsing-rules.md"
  cp LICENSE "$p/LICENSE"
done
echo "shared docs synced"
