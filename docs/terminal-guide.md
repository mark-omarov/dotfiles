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

## Obsidian (nvim)

Requires `OBSIDIAN_VAULT` env var (see [Sessionizer](#sessionizer) config). Keymaps appear under `<Leader>O` in which-key.

| Key          | Action       |
| ------------ | ------------ |
| `<Leader>Oo` | Open note    |
| `<Leader>On` | New note     |
| `<Leader>Od` | Daily note   |
| `<Leader>Os` | Search notes |
| `<Leader>Ob` | Backlinks    |
| `<Leader>Ot` | Tags         |

## Markdown plugins

| Plugin                   | What it does                                            |
| ------------------------ | ------------------------------------------------------- |
| `render-markdown.nvim`   | Auto-renders headings, code blocks, and lists in-buffer |
| `:RenderMarkdown toggle` | Toggle render-markdown on/off                           |
| `marksman` LSP           | Markdown link completions, go-to-definition, etc.       |

## Neovim Dashboard

The dashboard (shown on startup) uses `snacks.nvim` with a two-pane layout. The right pane shows GitHub notifications, issues, PRs, and git diff stats.

### Dependencies

```bash
# GitHub CLI (required for right pane)
brew install gh
gh auth login

# GitHub notifications on dashboard
gh extension install meiji163/gh-notify
```

## Sessionizer

`Ctrl-f` auto-discovers git repos in `~/workspace` and standalone repos in `~` (like dotfiles).

Override search paths per machine in `~/.config/zsh/.zshrc.local`:

```bash
export SESSIONIZER_DIRS="$HOME/workspace $HOME/work-projects"
```

Set the Obsidian vault path for nvim Obsidian keymaps:

```bash
export OBSIDIAN_VAULT="$HOME/path/to/vault"
```

## Refactoring (`<Leader>r`)

Keymaps provided by AstroCommunity `refactoring-nvim` pack. Check `<Leader>r` in which-key for the full list.

LSP code actions (`<Leader>la`) provide language-specific refactors (e.g. TS move to file).

## Testing — neotest (`<Leader>T`)

Keymaps provided by AstroCommunity `neotest` pack. Check `<Leader>T` in which-key for the full list.

## Database — DBee (`<Leader>D`)

| Key          | Action                                   |
| ------------ | ---------------------------------------- |
| `<Leader>D`  | Open DBee (modern UI with result tables) |

Supports Postgres, MySQL, SQLite, MongoDB, Redis, etc. Connections are configured in the DBee UI.

## HTTP Client — kulala (`<Leader>H`)

Create `.http` files (IntelliJ HTTP Client format). Requires `curl`.

| Key          | Action                    |
| ------------ | ------------------------- |
| `<Leader>Hs` | Send request under cursor |
| `<Leader>Ha` | Send all requests in file |
| `<Leader>Hn` | Jump to next request      |
| `<Leader>Hp` | Jump to previous request  |

## Task Runner — overseer (`<Leader>M`)

Uses the AstroCommunity default keybindings under `<Leader>M`.

| Key          | Action                        |
| ------------ | ----------------------------- |
| `<Leader>Mr` | Run a task (select from list) |
| `<Leader>Mt` | Toggle task panel             |
| `<Leader>Ml` | Restart last task             |

Supports VS Code `tasks.json`, make, npm scripts, and custom commands.

## Infrastructure (`<Leader>I`)

| Key          | Action                                   |
| ------------ | ---------------------------------------- |
| `<Leader>Ik` | Open k9s in floating terminal            |
| `<Leader>Id` | Open lazydocker in floating terminal     |

External deps: `brew install lazydocker derailed/k9s/k9s`

## Search & Replace — grug-far (`<Leader>s`)

| Key                    | Action                         |
| ---------------------- | ------------------------------ |
| `<Leader>ss`           | Search/Replace workspace       |
| `<Leader>se`           | Search/Replace by filetype     |
| `<Leader>sf`           | Search/Replace in current file |
| `<Leader>sw`           | Replace word under cursor      |
| Visual + `<Leader>s`   | Replace selection              |

Ripgrep powered, supports regex and file filtering.

## Diagnostics — trouble.nvim (`<Leader>x`)

| Key          | Action                              |
| ------------ | ----------------------------------- |
| `<Leader>xx` | Toggle diagnostics list             |
| `<Leader>xX` | Toggle buffer diagnostics           |
| `<Leader>xs` | Toggle symbols outline              |
| `<Leader>xl` | Toggle location list                |
| `<Leader>xq` | Toggle quickfix list                |

Check `<Leader>x` in which-key for the full list — trouble.nvim enhances the default quickfix/diagnostics group.

## Surround — mini.surround (`gz`)

Prefix is `gz` (to avoid conflict with vim's built-in `s`).

| Key    | Action                                            |
| ------ | ------------------------------------------------- |
| `gza`  | Add surrounding (e.g. `gzaiw"` wraps word in `"`) |
| `gzd`  | Delete surrounding (e.g. `gzd"` removes `"`)      |
| `gzr`  | Replace surrounding (e.g. `gzr"'` changes `"` to `'`) |
| `gzf`  | Find surrounding (jump forward)                   |
| `gzF`  | Find surrounding (jump backward)                  |
| `gzh`  | Highlight surrounding                             |

Works in normal and visual mode. Supports `()`, `[]`, `{}`, `""`, `''`, `` ` ``, HTML tags, and more.

## LSP Enhancements

| Feature           | What it does                                              |
| ----------------- | --------------------------------------------------------- |
| `inc-rename`      | Inline rename with live preview (replaces rename prompt)  |
| `actions-preview` | Shows diff preview before applying code actions           |

## Already built-in (AstroNvim defaults)

| Feature         | Keys                                         |
| --------------- | -------------------------------------------- |
| TODO comments   | `]t`/`[t` jump, `:TodoLocList` to list all   |
| Git blame       | `<Leader>gl` line blame                      |
| Marks/bookmarks | `ma` set mark a, `'a` jump, `:marks` list   |
| Terminal        | `<Leader>tf` float, `<Leader>th` horizontal, `<F7>` toggle |
