# 🐓 hayloft

A humble, reproducible terminal development environment for local and HPC systems.

**Tools included:**

* Neovim (Lua-based, with Tree-sitter + LSP)
* tmux (with TPM + sensible defaults)
* Optional zsh + Oh My Zsh
* Farmer-style aesthetics
* Dotfile linking and config switching
* Justfile-based CLI interface

---

## Quick Start

Clone and bootstrap the hayloft:

```bash
git clone https://github.com/YOURUSERNAME/hayloft.git
cd hayloft
just setup

# Optional: add hayloft/bin to PATH for dev tools
export PATH="$HOME/path/to/hayloft/bin:$PATH"
```

You’ll be prompted to:

* Install and use Neovim (or fallback to Vim)
* Optionally install zsh (skipped on clusters)
* Link all configs safely into `~`

---

## Environment Modes

Set `HAYLOFT_ENV` in `hayloft.config`:

```ini
HAYLOFT_ENV=local    # or "cluster"
```

| Mode      | Behavior                   |
| --------- | -------------------------- |
| `local`   | Full install: zsh, Neovim  |
| `cluster` | Skips zsh, defaults to Vim |

---

## Config Preview

```bash
config/
├── vimrc
├── zshrc
├── tmux.conf
└── nvim/
    ├── init.lua
    └── lua/
        ├── options.lua
        ├── plugins.lua
        ├── lsp.lua
        └── keymaps.lua
```

---

## Prerequisites

You’ll need:

* macOS or Linux
* `git`, `bash`, and `just` (install via `brew`, `apt`, etc.)

```bash
# macOS
brew install just

# Ubuntu
sudo apt install just
```

---

## Maintenance

| Command       | Purpose                         |
| ------------- | ------------------------------- |
| `just setup`  | Install and link everything 🐓  |
| `just reset`  | Remove dotfiles (with 🩹 emoji) |
| `just update` | Pull latest from barn 🐖        |

---

## 📝 Cheatsheet
[Here](https://github.com/thehalfspace/hayloft/blob/main/CHEATSHEET.md) are some shortcuts and commands I use.

## 🐖 Credits & Style

Vibe coded mostly.

Logs include:

* `🧪` organizing
* `🐓` ready
* `🧆` skipping
* `🌾` status
* `🐖` errors

---

## Project Justfile Templates (WIP: may or may not be completed)

Hayloft includes reusable **Justfile templates** to bootstrap new projects with common workflows. I have only added cpp for now.

### 📁 Template Location

```
templates/justfiles/
├── default.justfile    # Minimal base template
├── cpp.justfile        # Cpp make commands
├── hpc-batch.justfile  # HPC job submission commands
└── ... more templates
```

### 🪚 Usage Example

To create a new Justfile in your project directory:

```bash
just new <template>
```

For example:

```bash
just new cpp
```

This will copy `cpp.justfile` as `./justfile` in your current directory.

---

### Uninstalling
From inside the hayloft folder, run `just uninstall`

> Note: You need to separately remove the packages installed via package managers, e.g., `brew uninstall just` etc.

## 📸 Screenshots


---

## 📬 Contributing

Feel free to fork and adapt this system for your own hayloft 🧑‍🌾
PRs with new tools or config sets are welcome!

