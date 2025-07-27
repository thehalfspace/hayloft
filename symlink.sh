#!/usr/bin/env bash

set -e
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$REPO_DIR/config"

# Load emoji logging functions
source "$REPO_DIR/install/common.sh"

log_rake "Linking config files into your home directory 🧺"

link_dotfile() {
  local src="$CONFIG_DIR/$1"
  local dest="$HOME/.$1"

  if [[ -L "$dest" ]]; then
    log_duck "Removing existing symlink $dest"
    rm "$dest"
  elif [[ -f "$dest" || -d "$dest" ]]; then
    log_duck "Backing up existing $dest → ${dest}.bak"
    mv "$dest" "${dest}.bak"
  fi

  ln -s "$src" "$dest"
  log_chicken "Linked $dest ← $src"
}

# Link dotfiles
link_dotfile "vimrc"
link_dotfile "zshrc"
link_dotfile "tmux.conf"

log_hay "All config files linked successfully! 🌾"

