#!/usr/bin/env bash

set -e

# Define repo root
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$REPO_DIR/install"
CONFIG_DIR="$REPO_DIR/config"

source "$INSTALL_DIR/common.sh"

info "Bootstrapping your development environment..."

prompt_package_manager

run_with_pm "neovim" "$INSTALL_DIR/nvim.sh"
run_with_pm "tmux" "$INSTALL_DIR/tmux.sh"

read -p "Do you want to install and configure zsh? (y/n): " zsh_confirm
if [[ "$zsh_confirm" =~ ^[Yy]$ ]]; then
    run_with_pm "zsh" "$INSTALL_DIR/zsh.sh"
else
    info "Skipping zsh installation."
fi

bash "$REPO_DIR/symlink.sh"

echo "\n✅ Environment setup complete. Launch Neovim or tmux to get started."

