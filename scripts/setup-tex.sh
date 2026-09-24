#!/bin/sh
set -eu

cd "$(dirname "$0")/.."

if ! command -v tlmgr >/dev/null 2>&1; then
  echo "tlmgr not on PATH." >&2
  echo "Install TeX Live first (MacTeX Basic on macOS). MiKTeX has no tlmgr; compile with latexmk and let it install packages." >&2
  echo "See README, section Set up." >&2
  exit 1
fi

# User tree. Works without sudo when the TeX Live install is owned by root.
tlmgr init-usertree >/dev/null 2>&1 || true

pkgs=$(grep -vE '^[[:space:]]*(#|$)' texlive-packages.txt | grep -vx 'sourcesans' | grep -vx 'sourcesanspro')
# shellcheck disable=SC2086
tlmgr --usermode install $pkgs

# TeX Live 2026 renamed sourcesanspro -> sourcesans. The sty file name did not change.
if ! tlmgr --usermode install sourcesans; then
  echo "sourcesans is not in this TeX Live; installing sourcesanspro"
  tlmgr --usermode install sourcesanspro
fi
