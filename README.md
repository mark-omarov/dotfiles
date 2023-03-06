# Mark's Dotfiles

> BE AWARE! If you execute the script it will replace any existing files with symlinks, and will not prompt you to confirm nor create a backup. Proceed with caution. I do not take any responsibility for the data loss. You have been warned.

This is meant to be a backup of my configurations.
I use [stow][stow] to manage the symlinks, and a little hack to avoid issues with existing files. Be aware that the script to automatically apply configuration changes is destructive, and will essentially replace any existing files with symlinks.

There are a few exceptions:
- `fonts` - macOS does not support symlinks in the `~/Library/Fonts` directory. The script will hard link files to that directory (doesn't override existing if present). If you don't use the script - you can manually place the fonts in the directory.
- `ssh` - it contains my **encrypted** private key, you don't have the key to decrypt the file, you will have to replace the file with your own. Don't forget to replace the public key as well. And if you were to use this repository - **don't forget to encrypt your private key** before pushing it to the repository.
- `raycast` - it contains my **encrypted** settings, additionally [Raycast][raycast] doesn't support automatic import at this time and the settings needs to be imported manually though the application itself. Settings might contain sensitive information, please use encryption for your settings as well.

## Prerequisites
You can use any method to apply the configuration changes, but I use a script to automate the process. The script is written in bash, and requires the following packages to be installed:
- git
- stow

## Applying the configuration changes

This setup is designed to be executed by an ansible playbook, but you can also run the script manually.

The following is an example playbook:
```yaml
- name: Ensure dotfiles stowed
  ansible.builtin.shell: "./run.sh"
  args:
    chdir: "/path/to/your/dotfiles/directory"
```

The following is an example of how to run the script manually:
```bash
./run.sh
```

[stow]: https://www.gnu.org/software/stow/
[raycast]: https://www.raycast.com/

## Setting up optional plugins
- To setup GitHub Copilot plugin follow the [official documentation](https://github.com/github/copilot.vim) or `:help copilot`
