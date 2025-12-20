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

# Cluster-specific setup: add module load to .bashrc
if [[ "$HAYLOFT_ENV" == "cluster" ]]; then
  log_hay "🐄 Cluster mode: Adding tmux module load to ~/.bashrc"

  # Check if module load already exists
  if ! grep -q "module load tmux" ~/.bashrc 2>/dev/null; then
    # Find the hayloft module loads section and add tmux
    if grep -q "# hayloft module loads" ~/.bashrc 2>/dev/null; then
      # Add after the existing module loads section
      sed -i.bak '/# hayloft module loads/a\
module load tmux' ~/.bashrc
      log_chicken "Added 'module load tmux' to ~/.bashrc"
    else
      # Create new section
      cat >> ~/.bashrc << 'EOF'

# hayloft module loads
module load tmux
EOF
      log_chicken "Added 'module load tmux' to ~/.bashrc"
    fi
  else
    log_duck "Module load tmux already in ~/.bashrc"
  fi

  log_hay "⚠️  Please run 'source ~/.bashrc' or login again to load modules"
fi

# Only install plugins if tmux server is running
if tmux info &>/dev/null; then
  log_saw "Installing tmux plugins via TPM..."
  ~/.tmux/plugins/tpm/bin/install_plugins
else
  log_duck "Tmux not running — skipping plugin install 🦆"
  echo "🐓 Run this inside tmux later: prefix + I (default: Ctrl-a I)"
fi

log_hay "tmux is all set! Start tmux with 🐓 tmux"

