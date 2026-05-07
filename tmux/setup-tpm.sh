#!/usr/bin/env bash

set -euo pipefail

TPM_REPO="${TPM_REPO:-https://github.com/tmux-plugins/tpm.git}"
TPM_DIR="${TPM_DIR:-$HOME/.tmux/plugins/tpm}"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required to install tmux plugin manager (TPM)." >&2
  exit 1
fi

if [[ -d "$TPM_DIR/.git" ]]; then
  echo "Updating TPM in $TPM_DIR"
  git -C "$TPM_DIR" pull --ff-only
elif [[ -e "$TPM_DIR" ]]; then
  echo "$TPM_DIR already exists but is not a git checkout. Remove it first if you want to install TPM there." >&2
  exit 1
else
  mkdir -p "$(dirname "$TPM_DIR")"
  echo "Installing TPM to $TPM_DIR"
  git clone "$TPM_REPO" "$TPM_DIR"
fi

echo "TPM is installed at $TPM_DIR"
echo "Inside tmux, press prefix + I to install configured plugins."
