# 🧪 hayloft Cheatsheet

Quick reference for common keybindings and commands in your hayloft environment. Perfect for new users or those returning from the fields. 🧑‍🌾

---

## 📂 Vim / Neovim

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

| Action                        | Shortcut                              |
| ----------------------------- | ------------------------------------- |
| Enter command mode (no Shift) | `;` (remapped from `:`)               |
| Pane navigation               | `Ctrl-h/j/k/l` to move between splits |

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

