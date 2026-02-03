# Terminal Guide

Quick reference for zsh vi-mode, tmux, and terminal navigation.

## zsh vi-mode

You start in **insert mode** (normal typing). Press `Esc` to enter **normal mode**.

### Normal mode (after Esc)

| Key         | Action                        |
| ----------- | ----------------------------- |
| `i`         | Insert at cursor              |
| `I`         | Insert at line start          |
| `a`         | Append after cursor           |
| `A`         | Append at line end            |
| `0`         | Jump to line start            |
| `$`         | Jump to line end              |
| `w`         | Forward one word              |
| `b`         | Back one word                 |
| `e`         | End of word                   |
| `x`         | Delete char under cursor      |
| `dw`        | Delete word                   |
| `db`        | Delete word backwards         |
| `dd`        | Delete entire line            |
| `d$` or `D` | Delete to end of line         |
| `cw`        | Change word (delete + insert) |
| `cc`        | Change entire line            |
| `p`         | Paste after cursor            |
| `u`         | Undo                          |

## tmux (prefix is `Ctrl-a`)

### Sessions, windows, panes

| Key          | Action                  |
| ------------ | ----------------------- |
| `Ctrl-a c`   | New window              |
| `Ctrl-a 1-9` | Switch to window N      |
| `Ctrl-a \|`  | Split pane horizontally |
| `Ctrl-a -`   | Split pane vertically   |
| `Alt-Arrow`  | Switch pane             |
| `Ctrl-a d`   | Detach session          |
| `Ctrl-a r`   | Reload tmux config      |
| `Ctrl-f`     | Tmux sessionizer popup  |

### Copy mode

| Key                 | Action                                   |
| ------------------- | ---------------------------------------- |
| `Ctrl-a [`          | Enter copy mode                          |
| `q`                 | Exit copy mode                           |
| `j/k/h/l`           | Move down/up/left/right (vi keys)        |
| `Ctrl-u` / `Ctrl-d` | Page up / page down                      |
| `g`                 | Top of buffer                            |
| `G`                 | Bottom of buffer                         |
| `/`                 | Search forward (type query, press Enter) |
| `?`                 | Search backward                          |
| `n`                 | Next search match                        |
| `N`                 | Previous search match                    |
| `v`                 | Start selection                          |
| `y`                 | Yank selection to macOS clipboard        |

## General terminal shortcuts

| Key              | Action                                          |
| ---------------- | ----------------------------------------------- |
| `v`              | Open nvim                                       |
| `Ctrl-f`         | Project sessionizer (find/create tmux sessions) |
| `Ctrl-r`         | Reverse history search (fzf)                    |
| `Up/Down`        | History search filtered by current input        |
| `Alt-Left/Right` | Move word left/right in insert mode             |
| `F7`             | Toggle nvim terminal                            |
| `lg`             | Lazygit (with cd-on-exit)                       |
| `y`              | Yazi file manager (with cd-on-exit)             |

## Sessionizer

`Ctrl-f` auto-discovers git repos in `~/workspace` and standalone repos in `~` (like dotfiles).

Override search paths per machine in `~/.config/zsh/.zshrc.local`:

```bash
export SESSIONIZER_DIRS="$HOME/workspace $HOME/work-projects"
```
