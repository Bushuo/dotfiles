#!/usr/bin/env bash

# Sets up dotfiles by symlinking configs to their expected locations on macOS.

if [[ "$(uname)" != "Darwin" ]]; then
  echo "Not on macOS, skipping."
  exit 0
fi

DOTFILES_ROOT="$(cd "$(dirname "$0")" && pwd)"
EXIT_CODE=0

link_config() {
  local source="$1"
  local target="$2"

  if [[ -e "$target" || -L "$target" ]]; then
    echo "$target already exists, skipping. Remove it first if you want to re-link."
    EXIT_CODE=1
    return
  fi

  mkdir -p "$(dirname "$target")"
  ln -s "$source" "$target"
  echo "Linked $source -> $target"
}

link_config "$DOTFILES_ROOT/nvim" "$HOME/.config/nvim"
link_config "$DOTFILES_ROOT/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
link_config "$DOTFILES_ROOT/tmux/.tmux.conf" "$HOME/.tmux.conf"

exit "$EXIT_CODE"
