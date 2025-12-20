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

| Mode      | Behavior                                                        |
| --------- | --------------------------------------------------------------- |
| `local`   | Full install: zsh, Neovim, tmux (via package managers)         |
| `cluster` | HPC mode: Uses Neovim & tmux via modules, skips zsh, uses bash |

### Cluster Mode Details

When `HAYLOFT_ENV=cluster`, hayloft will:

* Skip zsh installation (avoids conflicts with HPC module systems)
* Configure Neovim with all plugins and LSP support
* Set up tmux with TPM and custom configurations
* Add `module load neovim` and `module load tmux` to your `~/.bashrc`
* Use bash as the shell (compatible with HPC environment modules)

After setup on a cluster, run `source ~/.bashrc` or login again to load the modules.

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

## HPC/Cluster Usage

For HPC environments with environment module systems:

1. Set `HAYLOFT_ENV=cluster` in `hayloft.config`
2. Clone hayloft to your home directory on the cluster
3. Run `just setup`
4. The script will:
   - Configure Neovim (without installing the binary)
   - Configure tmux (without installing the binary)
   - Add module load commands to `~/.bashrc`
   - Skip zsh to avoid shell conflicts
5. After setup: `source ~/.bashrc` or logout/login
6. Verify modules loaded: `module list`

The Neovim and tmux configurations will work seamlessly with cluster-provided modules.

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

