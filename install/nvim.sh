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

# Cluster-specific setup: add module load to .bashrc
if [[ "$HAYLOFT_ENV" == "cluster" ]]; then
  log_hay "🐄 Cluster mode: Adding module load commands to ~/.bashrc"

  # Check if module load already exists
  if ! grep -q "# hayloft module loads" ~/.bashrc 2>/dev/null; then
    cat >> ~/.bashrc << 'EOF'

# hayloft module loads
module load neovim
EOF
    log_chicken "Added 'module load neovim' to ~/.bashrc"
  else
    log_duck "Module load commands already in ~/.bashrc"
  fi

  log_hay "⚠️  Please run 'source ~/.bashrc' or login again to load modules"
fi

log_hay "Neovim is ready. Launch with 'nvim' 🐓"

