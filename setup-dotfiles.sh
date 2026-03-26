#!/usr/bin/env bash

# Sets up dotfiles by symlinking configs to their expected locations on macOS.

if [[ "$(uname)" != "Darwin" ]]; then
  echo "Not on macOS, skipping."
  exit 0
fi

DOTFILES_NVIM="$(cd "$(dirname "$0")" && pwd)/nvim"
TARGET="$HOME/.config/nvim"

if [[ -e "$TARGET" || -L "$TARGET" ]]; then
  echo "$TARGET already exists, skipping. Remove it first if you want to re-link."
  exit 1
fi

mkdir -p "$HOME/.config"
ln -s "$DOTFILES_NVIM" "$TARGET"
echo "Linked $DOTFILES_NVIM -> $TARGET"
