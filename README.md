# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/). Targets [Omarchy](https://omarchy.org).

Secrets live in 1Password and are read at apply time. Nothing sensitive is committed.

```sh
chezmoi init --apply mark-omarov
```

## Branches

- `main` — Omarchy (current)
- `macos` — the previous Ansible + stow setup, kept for reference
