#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="$(tr -d '\r\n' < "$ROOT/.hugo-version")"
case "$(uname -m)" in x86_64) ARCH=amd64 ;; aarch64|arm64) ARCH=arm64 ;; *) echo 'Nicht unterstützte Architektur' >&2; exit 1 ;; esac
DEST="$ROOT/.tools/linux"
mkdir -p "$DEST"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
FILE="hugo_${VERSION}_linux-${ARCH}.tar.gz"
URL="https://github.com/gohugoio/hugo/releases/download/v${VERSION}"
curl -fLsS --retry 3 "$URL/$FILE" -o "$TMP/$FILE"
curl -fLsS --retry 3 "$URL/hugo_${VERSION}_checksums.txt" -o "$TMP/checksums.txt"
(cd "$TMP"; tr -d '\r' < checksums.txt | grep "  ${FILE}$" | sha256sum --check --strict)
tar -xzf "$TMP/$FILE" -C "$DEST" hugo
"$DEST/hugo" version
