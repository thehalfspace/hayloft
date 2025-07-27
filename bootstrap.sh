#!/usr/bin/env bash

set -e

# Define repo root
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$REPO_DIR/install"
CONFIG_DIR="$REPO_DIR/config"

source "$INSTALL_DIR/common.sh"

log_rake "Welcome to the hayloft. Time to set up your tools..."

prompt_package_manager

read -p "Do you want to install and use Neovim? (y/n): " use_nvim
if [[ "$use_nvim" =~ ^[Yy]$ ]]; then
  run_with_pm "neovim" "$INSTALL_DIR/nvim.sh" "nvim"
else
  log_duck "Using Vim fallback config only. Please use :PlugInstall the first time you open vim 🦆"
  
  if [[ -f ~/.vimrc || -L ~/.vimrc ]]; then
    log_duck "Removing existing ~/.vimrc"
    rm ~/.vimrc
  fi

  ln -sf "$CONFIG_DIR/vimrc" ~/.vimrc
  log_chicken "Linked ~/.vimrc ← $CONFIG_DIR/vimrc"
fi

run_with_pm "tmux" "$INSTALL_DIR/tmux.sh"

read -p "Do you want to install and configure zsh? (y/n): " zsh_confirm
if [[ "$zsh_confirm" =~ ^[Yy]$ ]]; then
    run_with_pm "zsh" "$INSTALL_DIR/zsh.sh"
else
   log_duck "Skipping zsh installation. 🦆" 
fi

# mkdir -p "$HOME/bin"
# ln -sf "$REPO_DIR/bin/devtmux" "$HOME/bin/devtmux"

bash "$REPO_DIR/symlink.sh"

echo "\n✅ Environment setup complete. Launch Neovim or tmux to get started."

