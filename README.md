# Dotfiles

These are my dotfiles. I use ansible to manage them. The playbook is designed to run on macOS, I cannot guarantee it will work on other systems.

![Kapture 2024-07-25 at 05 48 46](https://github.com/user-attachments/assets/8bf78923-77f9-47c1-a6ea-7293f110614b)

## Highlights

- Automated setup with [Ansible](https://github.com/ansible/ansible)
- Homebrew, macOS dock and mas applications setup (see `vars/` directory)
- [Starship](https://starship.rs/) prompt with [Hack Nerd Font](https://www.nerdfonts.com/)
- [Wezterm](https://wezfurlong.org/wezterm/) minimal style terminal configuration
- [Yabai](https://github.com/koekeishiya/yabai) and [skhd](https://github.com/koekeishiya/skhd) window manager and hotkey daemon
- Secrets management with [ansible-vault](https://docs.ansible.com/ansible/latest/vault_guide/index.html) (private submodule)
- Runtimes: NodeJS LTS with Corepack enabled

## Installation

- Make sure you got xcode command line tools: `xcode-select --install`
- Make sure you got `python3`, I recommend using [pyenv](https://github.com/pyenv/pyenv) to manage python versions.
- Install ansible: `pip3 install ansible`
- Install ansible dependencies: `ansible-galaxy install -r requirements.yml`
- Install [tmux plugin manager](https://github.com/tmux-plugins/tpm)

## Usage

> [!IMPORTANT]
> Do not blindly run the setup. Thoroughly review all roles and playbooks, make any necessary changes to fit your needs, especially where my no-reply email and other info is specified.
>
> The playbook will not prompt you to confirm nor create a backup. Proceed with caution. I do not take any responsibility for the data loss. You have been warned.
>
> Be aware that `roles/dotfiles/files/secrets` is a git submodule to a private repository with encrypted files I use. If you want a similar setup, you will need to configure it yourself. However, the playbook should work without it.

To apply the configuration changes, run the following command:

```bash
make setup
```

You may augment the command with any valid ansible options, for example, if you use ansible-vault, you might run:

```bash
make setup ARGS="--ask-vault-pass"
```

To complete the setup, you will need to manually start yabai and skhd services and configure their permissions.

```bash
yabai --start-service
skhd --start-service
```

## Secrets Management

The `dotfiles` role supports a secrets submodule. It's best for you to review the role to see how it works exactly. But in short, it will decrypt all files that end with `.enc` under `roles/dotfiles/files/secrets` using ansible-vault. You **have to** make adjustments to fit your needs.

**Why I automate secrets setup?**

I don't like setting up ssh, gpg, or other keys and credentials manually. I prefer to have them encrypted and stored in a private repository. This way I can easily clone the repository and have all the necessary files in place. The `dotfiles` role outlines what secrets are dotfiles specific and will be decrypted, moved to correct location, and symlinked. And what secrets are not, and will be decrypted and left as is. I use non-dotfiles secrets to setup applications that don't have a configuration file that can be symlinked or require manual import.

**Can I clean up non-dotfiles secrets?**

If you use secrets submodule, after running the playbook, you may want to remove all decrypted non-dotfiles files from the secrets directory after you manually import them in your applications. You can do this by running:

```bash
make clean
```
