export XDG_CONFIG_HOME=$HOME/.config
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
export VISUAL=$EDITOR

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_ANALYTIC=1 # Disable Homebrew analytics

# Configure pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Alias git to brew git
alias git=/opt/homebrew/bin/git
alias vi=nvim

# Autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# fzf keybindings and auto-completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# tmux-sessionizer by @ThePrimeagen
bindkey -s ^f "tmux-sessionizer\n"

# Rust/Cargo
[ -f ~/.cargo/env ] && source $HOME/.cargo/env
