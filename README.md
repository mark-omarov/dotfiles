# Mark's Dotfiles

> BE AWARE! If you execute the script it will replace any existing files with symlinks, and will not prompt you to confirm nor create a backup. Proceed with caution. I do not take any responsibility for the data loss. You have been warned.

This is meant to be a backup of my configurations.
I use [stow][stow] to manage the symlinks, and a little hack to avoid issues with existing files. Be aware that the script to automatically apply configuration changes is destructive, and will essentially replace any existing files with symlinks.

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
