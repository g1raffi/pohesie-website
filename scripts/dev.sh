#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
HUGO="$ROOT/.tools/linux/hugo"
if [[ ! -x "$HUGO" ]]; then
  echo 'Hugo fehlt. Zuerst ./scripts/install-hugo.sh ausführen.' >&2
  exit 1
fi
exec "$HUGO" server --bind 127.0.0.1 --port 1313 --baseURL http://localhost:1313/ --cacheDir "$ROOT/.cache" "$@"
