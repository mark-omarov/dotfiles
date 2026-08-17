# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/). Targets [Omarchy](https://omarchy.org).

Secrets live in 1Password and are read at apply time. Nothing sensitive is committed.

## Install

```sh
omarchy pkg add chezmoi
chezmoi init --apply --source ~/Work/github.com/mark-omarov/dotfiles mark-omarov
```

`--source` keeps the repo in the normal checkout location instead of chezmoi's default.

## What's tracked

Only files that differ from Omarchy's shipped defaults, plus `~/.config/nvim`
(LazyVim, seeded from `/etc/skel` and never updated in place).

Unmodified Omarchy defaults are deliberately left alone, so upstream
improvements keep arriving. Run `omarchy-refresh-config <path>` to restore one.

## Branches

- `main` — Omarchy (current)
- `macos` — the previous Ansible + stow setup, kept for reference
