# hayloft justfile 🧺🐓

# Default task
default:
    @just --summary

# Bootstrap your environment 🌾
setup:
    echo "🪓 Bootstrapping the hayloft workspace..."
    bash ./bootstrap.sh

# Remove symlinks and reset configs 🐖
reset:
    echo "🧹 Clearing out the old hay..."
    rm -f ~/.vimrc ~/.tmux.conf ~/.zshrc
    echo "🌾 All cleaned. You're ready for a fresh rake."

# Update hayloft configs (pull from Git) 🪚
update:
    echo "🔄 Fetching latest from the barn..."
    git pull origin main

