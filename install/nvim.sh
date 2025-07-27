#!/usr/bin/env bash

set -e
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_DIR="$REPO_DIR/config"

# Load emoji log functions
source "$(dirname "$0")/common.sh"

log_saw "Setting up Neovim... 🪚"

# Ensure config directory exists
mkdir -p ~/.config/nvim

# Copy base config (init.lua and lua/ folder)
cp -r "$CONFIG_DIR/nvim/"* ~/.config/nvim/

# Link for classic Vim users
ln -sf "$CONFIG_DIR/vimrc" ~/.vimrc

log_hay "Neovim config installed at ~/.config/nvim"
log_chicken "Vim fallback symlink created at ~/.vimrc"

# Plugin manager: lazy.nvim (modern replacement for vim-plug)
if [ ! -d "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/lazy/start/lazy.nvim" ]; then
  log_rake "Installing lazy.nvim plugin manager..."
  git clone --filter=blob:none https://github.com/folke/lazy.nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/lazy/start/lazy.nvim
else
  log_chicken "lazy.nvim already installed."
fi

log_hay "Neovim is ready. Launch with 'nvim' 🐓"

