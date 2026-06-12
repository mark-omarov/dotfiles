# Terminal Guide

Quick reference for zsh vi-mode, tmux, terminal tools, and Neovim.

## Contents

- [zsh vi-mode](#zsh-vi-mode)
- [tmux](#tmux-prefix-is-ctrl-a)
- [General terminal](#general-terminal-shortcuts)
- [Lazygit](#lazygit-lg)
- [Yazi (standalone)](#yazi-standalone-tui)
- [Nvim — core navigation](#nvim--core-navigation)
- [Nvim — LSP](#nvim--lsp)
- [Nvim — treesitter text objects](#nvim--treesitter-text-objects)
- [Nvim — dashboard](#nvim--dashboard)
- [Obsidian](#obsidian-nvim)
- [Markdown plugins](#markdown-plugins)
- [Database — DBee](#database--dbee-leaderd)
- [HTTP client — kulala](#http-client--kulala-leaderh)
- [Task runner — overseer](#task-runner--overseer-leaderm)
- [Infrastructure (k9s / lazydocker)](#infrastructure-leaderi)
- [Git worktrees](#git-worktrees-leadergw)
- [Search & replace — grug-far](#search--replace--grug-far-leaders)
- [Diagnostics — trouble.nvim](#diagnostics--troublenvim-leaderx)
- [Surround — mini.surround](#surround--minisurround-gz)
- [Symbol outline — aerial](#symbol-outline--aerial)
- [Refactoring](#refactoring-leaderr)
- [Testing — neotest](#testing--neotest-leadert)
- [LSP enhancements](#lsp-enhancements)
- [Smear cursor](#smear-cursor)
- [AstroNvim built-ins](#already-built-in-astronvim-defaults)

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

## Lazygit (`lg`)

Launched via zsh alias `lg`. Cd-on-exit returns to repo root.

| Key     | Action                       |
| ------- | ---------------------------- |
| `?`     | Show all keybindings         |
| `Space` | Stage/unstage file or hunk   |
| `a`     | Stage/unstage all            |
| `c`     | Commit                       |
| `A`     | Amend last commit            |
| `P`     | Push                         |
| `p`     | Pull                         |
| `b`     | Branches panel               |
| `s`     | Stash changes                |
| `z`     | Undo                         |
| `x`     | Open menu (more actions)     |
| `q`     | Quit                         |
| `h/l`   | Switch panel left/right      |
| `j/k`   | Move down/up                 |
| `Enter` | Drill into item              |

## Yazi (standalone TUI)

Launched via zsh alias `y`. Cd-on-exit returns to selected dir.

| Key       | Action                                   |
| --------- | ---------------------------------------- |
| `h/j/k/l` | Navigate (parent / down / up / enter)    |
| `g`       | Go-to menu (`gh` home, `gc` config, …)   |
| `G`       | Jump to bottom                           |
| `y`       | Yank (copy)                              |
| `x`       | Cut                                      |
| `p`       | Paste                                    |
| `d`       | Delete (to trash)                        |
| `D`       | Delete permanently                       |
| `a`       | Create file/dir (end with `/` for dir)   |
| `r`       | Rename                                   |
| `/`       | Filter                                   |
| `?`       | Help (full keymap)                       |
| `Space`   | Select (multi-select with visual)        |
| `Enter`   | Open with default app                    |
| `Tab`     | Preview toggle                           |
| `q`       | Quit                                     |

## Nvim — core navigation

Leader is `Space`. Local leader is `,`.

### Files / buffers

| Key          | Action                        |
| ------------ | ----------------------------- |
| `<Leader>ff` | Find file (picker)            |
| `<Leader>fw` | Live grep in project          |
| `<Leader>fo` | Old (recent) files            |
| `<Leader>fb` | Buffers picker                |
| `<Leader>fh` | Help tags                     |
| `<Leader>fk` | Keymaps search                |
| `<Leader>e`  | Toggle neo-tree (file tree)   |
| `<Leader>o`  | Focus neo-tree                |
| `<Leader>c`  | Close buffer                  |
| `]b` / `[b`  | Next / previous buffer        |
| `<Leader>bd` | Close buffer via tabline pick |
| `<Leader>n`  | New file                      |
| `<Leader>w`  | Save                          |
| `<Leader>q`  | Quit                          |

### Windows

| Key              | Action               |
| ---------------- | -------------------- |
| `<C-h/j/k/l>`    | Move between windows |
| `<Leader>\|`     | Vertical split       |
| `<Leader>-`      | Horizontal split     |
| `<C-Up/Down>`    | Resize vertical      |
| `<C-Left/Right>` | Resize horizontal    |

### In-file motion

| Key             | Action                                |
| --------------- | ------------------------------------- |
| `gg` / `G`      | Top / bottom of file                  |
| `Ctrl-u/d`      | Half page up / down                   |
| `Ctrl-o/i`      | Jumplist back / forward               |
| `%`             | Matching bracket                      |
| `f<c>` / `F<c>` | Jump to char on line (forward/back)   |
| `t<c>` / `T<c>` | Jump to before char on line           |
| `*` / `#`       | Search word under cursor forward/back |
| `/pattern`      | Search forward                        |
| `n` / `N`       | Next / prev search match              |

## Nvim — LSP

| Key          | Action                              |
| ------------ | ----------------------------------- |
| `K`          | Hover doc                           |
| `gd`         | Go to definition                    |
| `gD`         | Go to declaration                   |
| `gr`         | References                          |
| `gI`         | Implementations                     |
| `gy`         | Type definition                     |
| `<Leader>la` | Code actions (with preview diff)    |
| `<Leader>lr` | Rename symbol (inline live preview) |
| `<Leader>lf` | Format buffer                       |
| `<Leader>lS` | Workspace symbols                   |
| `<Leader>ls` | Buffer symbols                      |
| `<Leader>ld` | Line diagnostics                    |
| `<Leader>lD` | Diagnostics list                    |
| `]d` / `[d`  | Next / prev diagnostic              |
| `<Leader>uY` | Toggle semantic highlight (buffer)  |
| `<Leader>uh` | Toggle inlay hints                  |

## Nvim — treesitter text objects

Installed via `astrocommunity.pack.typescript` / `pack.go`. Combine with `d`/`c`/`v`/`y`.

| Key  | Action                      |
| ---- | --------------------------- |
| `af` | Around function             |
| `if` | Inside function             |
| `ac` | Around class                |
| `ic` | Inside class                |
| `aa` | Around parameter/argument   |
| `ia` | Inside parameter/argument   |
| `]f` | Jump to next function start |
| `[f` | Jump to prev function start |
| `]c` | Jump to next class start    |
| `[c` | Jump to prev class start    |

Examples: `vaf` select function, `dif` delete function body, `cia` change argument.

## Nvim — dashboard

Shown on startup (empty-args `nvim`). Powered by `snacks.nvim`.

| Key | Action                                          |
| --- | ----------------------------------------------- |
| `f` | Find file                                       |
| `r` | Recent files                                    |
| `w` | Find word (live grep)                           |
| `p` | Projects                                        |
| `n` | New file                                        |
| `o` | Obsidian daily note (if `OBSIDIAN_VAULT` set)   |
| `s` | Search Obsidian notes (if `OBSIDIAN_VAULT` set) |
| `b` | Browse repo (gh in browser)                     |
| `N` | GitHub notifications (cmd pane)                 |
| `i` | GitHub issues list → web                        |
| `P` | GitHub PRs list → web                           |
| `q` | Quit                                            |

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

## Symbol outline — aerial

Installed via AstroCommunity pack. Outline of symbols in current buffer.

| Key          | Action                         |
| ------------ | ------------------------------ |
| `<Leader>lo` | Toggle aerial outline          |
| `{` / `}`    | Prev / next symbol (in aerial) |
| `Enter`      | Jump to symbol                 |
| `Tab`        | Fold symbol                    |

## Refactoring (`<Leader>r`)

AstroCommunity `refactoring-nvim` pack. Works on visual selection.

| Key           | Action                         |
| ------------- | ------------------------------ |
| `<Leader>re`  | Extract function               |
| `<Leader>rf`  | Extract function to file       |
| `<Leader>rv`  | Extract variable               |
| `<Leader>ri`  | Inline variable                |
| `<Leader>rb`  | Extract block                  |
| `<Leader>rbf` | Extract block to file          |
| `<Leader>rp`  | Debug print var under cursor   |
| `<Leader>rc`  | Cleanup debug prints           |
| `<Leader>rr`  | Refactor menu (pick from list) |

LSP-level refactors (TS move-to-file, etc.) still via `<Leader>la`.

## Testing — neotest (`<Leader>T`)

AstroCommunity `neotest` pack. Adapters: golang, jest, vitest.

| Key          | Action                    |
| ------------ | ------------------------- |
| `<Leader>Tt` | Run nearest test          |
| `<Leader>TT` | Run all tests in file     |
| `<Leader>Ta` | Run all tests (project)   |
| `<Leader>Tl` | Run last test             |
| `<Leader>Ts` | Toggle test summary panel |
| `<Leader>To` | Show test output          |
| `<Leader>TO` | Toggle output panel       |
| `<Leader>Tw` | Watch nearest test        |
| `<Leader>TW` | Watch test file           |
| `<Leader>Td` | Debug nearest test        |
| `<Leader>TS` | Stop nearest test         |

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

## Git Worktrees (`<Leader>gw`)

Manage git worktrees without leaving nvim. Uses Snacks picker for selection. When switching, nvim changes its cwd and remaps open buffers to the target worktree.

| Key          | Action                                 |
| ------------ | -------------------------------------- |
| `<Leader>gws` | Switch to a worktree (picker)         |
| `<Leader>gwn` | Create a new worktree (picker)        |
| `<Leader>gwr` | Remove a worktree (picker)            |

Commands are also available via `:GitWorktreeCreate`, `:GitWorktreeSwitch`, `:GitWorktreeRemove`, and `:GitWorktreeCreateExisting` (for an existing branch).

**Note:** Requires the repo to be a bare clone or have worktrees set up. Ensure upstream fetch is configured: `git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"`.

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

## LSP enhancements

| Feature           | Trigger                                            |
| ----------------- | -------------------------------------------------- |
| `inc-rename`      | `<Leader>lr` — live-preview rename as you type     |
| `actions-preview` | `<Leader>la` — diff preview before applying action |

## Smear cursor

`sphamba/smear-cursor.nvim`. Cosmetic cursor trail animation. No keymaps.

Toggle at runtime: `:lua require("smear_cursor").enabled = not require("smear_cursor").enabled`

## Already built-in (AstroNvim defaults)

### UI toggles (`<Leader>u`)

| Key          | Action                  |
| ------------ | ----------------------- |
| `<Leader>un` | Toggle line numbers     |
| `<Leader>uN` | Toggle relative numbers |
| `<Leader>uw` | Toggle wrap             |
| `<Leader>us` | Toggle spell            |
| `<Leader>ud` | Toggle diagnostics      |
| `<Leader>ui` | Toggle indent-blankline |
| `<Leader>uc` | Toggle autocompletion   |
| `<Leader>uS` | Toggle conceal          |

### Terminal (`<Leader>t`)

| Key          | Action                    |
| ------------ | ------------------------- |
| `<Leader>tf` | Float terminal            |
| `<Leader>th` | Horizontal terminal       |
| `<Leader>tv` | Vertical terminal         |
| `<Leader>tl` | Lazygit terminal          |
| `<F7>`       | Toggle last-used terminal |

### Git (`<Leader>g`)

| Key          | Action                 |
| ------------ | ---------------------- |
| `<Leader>gg` | Lazygit (full screen)  |
| `<Leader>gl` | Git blame current line |
| `<Leader>gb` | Git branches (picker)  |
| `<Leader>gc` | Git commits (picker)   |
| `<Leader>gs` | Git status (picker)    |
| `<Leader>gd` | Git diff               |
| `<Leader>gh` | Show hunk              |
| `]g` / `[g`  | Next / prev git hunk   |
| `<Leader>gp` | Preview hunk           |
| `<Leader>gr` | Reset hunk             |
| `<Leader>gS` | Stage hunk             |

### Misc

| Feature       | Keys                                         |
| ------------- | -------------------------------------------- |
| TODO comments | `]t`/`[t` jump, `:TodoLocList` list all      |
| Marks         | `ma` set, `'a` jump, `:marks` list           |
| Quickfix      | `<Leader>xq` toggle, `]q`/`[q` nav           |
| Which-key     | Hold any leader sequence → popup             |
| Undo tree     | `:earlier 10m`, `:later`                     |
| Project root  | Auto-detected via `.git`; see `:AstroReload` |
