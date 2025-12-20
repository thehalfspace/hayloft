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

# Uninstall the entire thing
uninstall:
    @echo "🧹 Starting hayloft uninstallation..."
    rm -rf ~/.config/nvim
    rm -f ~/.vimrc
    rm -f ~/.tmux.conf
    rm -f ~/.zshrc || true
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/state/nvim
    rm -rf ~/.cache/nvim
    rm -rf ~/.tmux/plugins/tpm
    @echo "🪚 Config files and plugins removed."

    @echo "🐄 Removing hayloft module loads from ~/.bashrc (if present)..."
    @if [ -f ~/.bashrc ]; then \
        sed -i.hayloft-bak '/# hayloft module loads/,/module load tmux/d' ~/.bashrc && \
        echo "🐓 Module loads removed from ~/.bashrc (backup: ~/.bashrc.hayloft-bak)"; \
    fi

    @echo "🐄 Hayloft uninstallation complete. To remove the hayloft folder itself, run:"
    @echo "rm -rf $(pwd)"
