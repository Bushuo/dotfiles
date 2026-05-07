#!/usr/bin/env bash

# Sets up dotfiles by symlinking configs to their expected locations on macOS.

if [[ "$(uname)" != "Darwin" ]]; then
  echo "Not on macOS, skipping."
  exit 0
fi

DOTFILES_ROOT="$(cd "$(dirname "$0")" && pwd)"
EXIT_CODE=0

# Faster macOS key repeat for terminal apps like Neovim.
# Smaller numbers mean faster repeat / shorter delay.
MACOS_KEY_REPEAT=2
MACOS_INITIAL_KEY_REPEAT=15

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

if ! "$DOTFILES_ROOT/tmux/setup-tpm.sh"; then
  EXIT_CODE=1
fi

defaults write -g KeyRepeat -int "$MACOS_KEY_REPEAT"
defaults write -g InitialKeyRepeat -int "$MACOS_INITIAL_KEY_REPEAT"
echo "Configured macOS key repeat: KeyRepeat=$MACOS_KEY_REPEAT InitialKeyRepeat=$MACOS_INITIAL_KEY_REPEAT"

echo "You may need to log out and back in for key repeat changes to fully apply."

exit "$EXIT_CODE"
