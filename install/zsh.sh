#!/usr/bin/env bash

set -e
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_DIR="$REPO_DIR/config"

source "$(dirname "$0")/common.sh"

log_saw "Installing Zsh... 🪚"

# Check if zsh is already installed
if ! command -v zsh &> /dev/null; then
  case "$PM" in
    apt) sudo apt update && sudo apt install -y zsh ;;
    yum) sudo yum install -y zsh ;;
    dnf) sudo dnf install -y zsh ;;
    brew) brew install zsh ;;
    *) log_error "Unsupported package manager: $PM" && exit 1 ;;
  esac
  log_chicken "Zsh installed successfully."
else
  log_chicken "Zsh already installed."
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  log_rake "Installing Oh My Zsh 🧺"
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  log_duck "Oh My Zsh already installed."
fi

# Link hayloft .zshrc
if [[ -f ~/.zshrc || -L ~/.zshrc ]]; then
  log_duck "Removing existing ~/.zshrc"
  rm ~/.zshrc
fi

ln -s "$CONFIG_DIR/zshrc" ~/.zshrc
log_hay "Linked hayloft .zshrc 🐓"

# Offer to set default shell to zsh
if [ "$SHELL" != "$(command -v zsh)" ]; then
  read -p "Do you want to set zsh as your default shell? (y/n): " shell_confirm
  if [[ "$shell_confirm" =~ ^[Yy]$ ]]; then
    chsh -s "$(command -v zsh)"
    log_rake "Default shell changed to zsh. You may need to logout/login."
  else
    log_duck "Zsh will not be set as your default shell."
  fi
else
  log_chicken "Zsh is already your default shell."
fi

# 🐓 Ask to launch zsh immediately
read -p "Do you want to launch zsh now? (y/n): " zsh_now
if [[ "$zsh_now" =~ ^[Yy]$ ]]; then
  log_chicken "Launching zsh 🐓"
  exec zsh
else
  log_duck "Staying in current shell. Run 'zsh' manually if needed 🦆"
fi

# Add hayloft/bin to PATH if not present
if ! grep -q "hayloft/bin" ~/.zshrc 2>/dev/null; then
  log_hay "Adding hayloft/bin to PATH in ~/.zshrc"
  cat >> ~/.zshrc << EOF

# hayloft bin directory
export PATH="$REPO_DIR/bin:\$PATH"
EOF
  log_chicken "Added hayloft/bin to PATH in ~/.zshrc"
else
  log_duck "hayloft/bin already in PATH"
fi

