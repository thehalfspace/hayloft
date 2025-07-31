# 🧪 hayloft Cheatsheet

Quick reference for common keybindings and commands in your hayloft environment. 🧑‍🌾

---

## 📂 Vim / Neovim

**Use `:Lazy sync` or `:Lazy update` in vim to update plugins**

### Navigation

| Action                   | Shortcut                   |
| ------------------------ | -------------------------- |
| Move cursor              | `h` `j` `k` `l`            |
| Move by word             | `w` / `b`                  |
| Move to line start / end | `0` / `$`                  |
| Page up / down           | `Ctrl-u` / `Ctrl-d`        |
| Jump to match            | `%` (matching brace/paren) |

### Editing

| Action           | Shortcut       |
| ---------------- | -------------- |
| Insert mode      | `i`            |
| Append           | `a`            |
| Visual mode      | `v`            |
| Delete line      | `dd`           |
| Copy (yank) line | `yy`           |
| Paste            | `p`            |
| Undo / Redo      | `u` / `Ctrl-r` |

### hayloft Custom Mappings
**Leader Key: `,` (comma)**
| Shortcut      | Mode   | Action                                 |
| ------------- | ------ | -------------------------------------- |
| `;`           | Normal | Enter command mode (`:`) without Shift |
| `<C-H/J/K/L>` | Normal | Move between vim splits                |
| `<leader>nn`  | Normal | Toggle file tree (NvimTree) 🌲         |

### Vim-Slime Shortcuts
**Sends to terminal**
| Shortcut     | Mode   | Action                    |
| ------------ | ------ | ------------------------- |
| `<leader>st` | Visual | Send selection to REPL 🐍 |
| `<leader>st` | Normal | Send paragraph to REPL 🐍 |
| `<leader>sl` | Normal | Send current line to REPL |
| `<leader>sc` | Normal | Open Slime config prompt  |

---

## 🔹 Tmux

### Sessions & Windows

| Action        | Shortcut                |
| ------------- | ----------------------- |
| Start tmux    | `tmux`                  |
| New window    | `Ctrl-a c`              |
| Switch window | `Ctrl-a n` / `Ctrl-a p` |
| Rename window | `Ctrl-a ,`              |
| List windows  | `Ctrl-a w`              |

### Pane Management

| Action             | Shortcut                                       |
| ------------------ | ---------------------------------------------- |
| Vertical split     | `Ctrl-a -`                                     |
| Horizontal split   | `Ctrl-a \`                                     |
| Move between panes | `Alt + Arrow Keys` or `Ctrl-a + Arrow Keys`    |
| Resize pane        | `Ctrl-a` then `Ctrl-Arrow` or use prefix + `:` |

### Other

| Action               | Shortcut                                   |
| -------------------- | ------------------------------------------ |
| Copy mode (vi-style) | `Ctrl-a [` then `v` to select, `y` to yank |
| Paste from buffer    | `Ctrl-a ]`                                 |
| Kill pane            | `Ctrl-a x`                                 |
| Kill session         | `exit` or `Ctrl-a :kill-session`           |


---

## 🌎 Zsh

Zsh is an enhanced shell with autocomplete, history, and theming via Oh My Zsh.

Documentation: [https://github.com/ohmyzsh/ohmyzsh/wiki](https://github.com/ohmyzsh/ohmyzsh/wiki)

To start using zsh:

```bash
zsh
```

To make zsh your default shell:

```bash
chsh -s $(which zsh)
```

---

Happy hacking from the hayloft! 🌾

