# Dotfiles

Portable dotfiles configuration supporting **macOS** and **Linux** systems, managed with Ansible for automated setup and consistency across environments.

![Kapture 2024-07-25 at 05 48 46](https://github.com/user-attachments/assets/8bf78923-77f9-47c1-a6ea-7293f110614b)

## Highlights

- 🖥️ **Cross-Platform**: Supports both macOS and Linux (Debian/Ubuntu, Fedora, Arch)
- 🤖 **Automated Setup**: Powered by [Ansible](https://github.com/ansible/ansible) for reproducible configurations
- 📦 **Smart Package Management**: Homebrew for macOS, native package managers for Linux
- ⚡ **Modern Tooling**: [Starship](https://starship.rs/) prompt, [Neovim](https://neovim.io/), [WezTerm](https://wezfurlong.org/wezterm/)
- 🔒 **Secrets Management**: Encrypted secrets via [ansible-vault](https://docs.ansible.com/ansible/latest/vault_guide/index.html)
- 🎨 **Consistent Experience**: Same shell configuration and keybindings across all platforms
- 🚀 **Development Ready**: Pre-configured runtimes (Node.js via fnm, Python via pyenv, Rust)

## Installation

### Prerequisites

**macOS:**
```bash
# Install Xcode command line tools
xcode-select --install
```

**Linux (Debian/Ubuntu):**
```bash
# Install required packages
sudo apt update
sudo apt install -y python3 python3-pip git build-essential
```

**Linux (Fedora/RHEL):**
```bash
# Install required packages
sudo dnf install -y python3 python3-pip git @development-tools
```

**Linux (Arch):**
```bash
# Install required packages
sudo pacman -S python python-pip git base-devel
```

### Setup Steps

1. **Install Ansible:**
   ```bash
   pip3 install ansible
   ```

2. **Install Ansible Galaxy dependencies:**
   ```bash
   ansible-galaxy install -r requirements.yml
   ```

3. **Install tmux plugin manager:**
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

## Usage

> [!IMPORTANT]
> **Review before running!** Thoroughly examine all roles and playbooks, especially:
> - Git configuration (`.gitconfig`) with my email and GPG key
> - SSH keys and secrets (if using the secrets submodule)
> - Platform-specific settings that may not apply to your setup
>
> **No backups are created automatically.** The playbook modifies your system without confirmation prompts. Proceed with caution.
>
> **Secrets submodule**: The `roles/dotfiles/files/secrets` is a git submodule to a private repository. The playbook works without it, but you'll need to configure your own secrets management if desired.

### Running the Setup

Apply all configurations:
```bash
make setup
```

With vault password (for encrypted secrets):
```bash
make setup ARGS="--ask-vault-pass"
```

Run specific roles only:
```bash
# Install packages only
make setup ARGS="--tags packages"

# Setup dotfiles only (skip package installation)
make setup ARGS="--tags dotfiles"

# Available tags: homebrew, macos, packages, linux, fonts, dotfiles, runtime
```

### Platform-Specific Post-Installation

**macOS only:**
After setup completes, manually start skhd hotkey daemon:
```bash
skhd --start-service
```

**Linux only:**
- Font cache is automatically rebuilt
- If using a window manager, configure keybindings separately (skhd alternative)
- Some GUI tools may require additional setup (see `vars/macos.yml` for macOS-specific apps)

## Platform Support

### Fully Supported
- ✅ **macOS** (Apple Silicon & Intel)
  - Homebrew package management
  - macOS App Store (mas) integration
  - Dock configuration
  - skhd hotkey daemon

- ✅ **Linux - Debian/Ubuntu**
  - APT package management
  - Native package installations

- ✅ **Linux - Fedora/RHEL**
  - DNF/YUM package management

- ✅ **Linux - Arch**
  - Pacman package management

### Cross-Platform Features
All platforms receive:
- Zsh with plugins (autosuggestions, syntax highlighting)
- Starship prompt
- Modern CLI tools (eza, zoxide, ripgrep, fd, fzf)
- Git configuration with aliases
- Tmux configuration
- Neovim/LunarVim setup
- WezTerm terminal emulator config
- Development runtimes (fnm, pyenv, rust, bun)

### Platform Differences
| Feature | macOS | Linux |
|---------|-------|-------|
| Package Manager | Homebrew | APT/DNF/Pacman |
| Font Location | `~/Library/Fonts/` | `~/.local/share/fonts/` |
| GPG Pinentry | pinentry-mac | pinentry-tty |
| Hotkey Daemon | skhd | Not included* |
| App Store | mas support | N/A |

*Linux window manager keybindings are typically configured separately (i3, sway, bspwm, etc.)

## Secrets Management

The `dotfiles` role supports encrypted secrets via ansible-vault:

**How it works:**
1. Encrypted files (`.enc`) in `roles/dotfiles/files/secrets` are decrypted during setup
2. **Dotfiles secrets** (SSH keys, GPG keys) are moved to correct locations and symlinked
3. **Non-dotfiles secrets** (API keys, tokens) are decrypted for manual import

**Why automate secrets?**
Eliminates manual setup of SSH keys, GPG keys, and credentials across new machines. Everything is encrypted in a private repository and automatically deployed.

**Cleanup decrypted secrets:**
After importing non-dotfiles secrets into applications:
```bash
make clean
```

## Customization

### Adding Packages

**macOS:**
Edit `vars/homebrew.config.yml` to add Homebrew packages or casks.

**Linux:**
Edit `vars/linux.yml` to add distribution-specific packages.

**All Platforms:**
Edit `vars/common.yml` for tools available everywhere.

### Configuration Files

All dotfiles are in `roles/dotfiles/files/dotfiles/` and are symlinked via GNU Stow:
- Shell: `.zshrc`, `.config/zsh/*`
- Editor: `.config/lvim/`
- Terminal: `.config/wezterm/`
- Git: `.gitconfig`
- Tmux: `.tmux.conf`

## Troubleshooting

**Ansible fails on Linux with permission errors:**
Ensure you run with `--ask-become-pass` if your user needs sudo:
```bash
make setup ARGS="--ask-become-pass"
```

**Package installation failures:**
Some packages may have different names across distributions. Check the error output and update `vars/linux.yml` accordingly.

**Zsh plugins not loading on Linux:**
Verify installation paths. Common locations:
- Debian/Ubuntu: `/usr/share/zsh-*`
- Arch: `/usr/share/zsh/plugins/`
- Fedora: `/usr/share/zsh/site-functions/`

**Fonts not appearing:**
- Linux: Run `fc-cache -fv` manually
- macOS: Restart applications or log out/in
