#!/usr/bin/env bash

set -e
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_DIR="$REPO_DIR/config"

# Load emoji log functions
source "$(dirname "$0")/common.sh"

log_saw "Setting up tmux... 🪚"

# Symlink .tmux.conf
if [[ -f ~/.tmux.conf || -L ~/.tmux.conf ]]; then
  log_duck "Removing existing ~/.tmux.conf"
  rm ~/.tmux.conf
fi

ln -s "$CONFIG_DIR/tmux.conf" ~/.tmux.conf
log_rake "Linked ~/.tmux.conf"

# Install TPM if not already present
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  log_hay "Installing TPM (Tmux Plugin Manager)..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  log_chicken "TPM already installed."
fi

# Install plugins non-interactively
log_saw "Installing tmux plugins via TPM..."
~/.tmux/plugins/tpm/bin/install_plugins

log_hay "tmux is all set! Start tmux with 🐓 tmux"

