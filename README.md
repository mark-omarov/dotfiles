# dotfiles

My [Omarchy](https://omarchy.org) setup, managed with [chezmoi](https://www.chezmoi.io/).

Secrets live in 1Password and are read at apply time. Nothing sensitive is committed.

## Install

```sh
omarchy pkg add chezmoi
chezmoi init --apply --source ~/Work/github.com/mark-omarov/dotfiles mark-omarov
```

`--source` keeps the repo in my normal checkout location instead of chezmoi's default.

## What's tracked

Only what differs from Omarchy's shipped defaults. Unmodified defaults are left
alone on purpose, so upstream improvements keep arriving instead of being pinned
to whatever I copied once. To restore one:

```sh
omarchy-refresh-config hypr/monitors.lua
```

`~/.config/nvim` is the exception. Omarchy seeds it from `/etc/skel` when the
account is created and never touches it again, so there is no upstream to drift
from and the whole directory is tracked.

## Branches

- `main` — Omarchy
- `macos` — the previous Ansible and stow setup, kept for reference
