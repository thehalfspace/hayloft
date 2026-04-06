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
link_dotfile "tmux.conf"

# Link env-specific zshrc
if [[ "$HAYLOFT_ENV" == "cluster" ]]; then
  log_hay "Linking cluster zshrc"
  if [[ -L "$HOME/.zshrc" || -f "$HOME/.zshrc" ]]; then
    log_duck "Removing existing ~/.zshrc"
    rm "$HOME/.zshrc"
  fi
  ln -s "$CONFIG_DIR/zshrc.cluster" "$HOME/.zshrc"
  log_chicken "Linked ~/.zshrc ← $CONFIG_DIR/zshrc.cluster"

  # Link myenvrc
  if [[ -L "$HOME/.myenvrc" || -f "$HOME/.myenvrc" ]]; then
    log_duck "Removing existing ~/.myenvrc"
    rm "$HOME/.myenvrc"
  fi
  ln -s "$CONFIG_DIR/myenvrc" "$HOME/.myenvrc"
  log_chicken "Linked ~/.myenvrc ← $CONFIG_DIR/myenvrc"
else
  log_hay "Linking local zshrc"
  if [[ -L "$HOME/.zshrc" || -f "$HOME/.zshrc" ]]; then
    log_duck "Removing existing ~/.zshrc"
    rm "$HOME/.zshrc"
  fi
  ln -s "$CONFIG_DIR/zshrc.local" "$HOME/.zshrc"
  log_chicken "Linked ~/.zshrc ← $CONFIG_DIR/zshrc.local"
fi

log_hay "All config files linked successfully! 🌾"

