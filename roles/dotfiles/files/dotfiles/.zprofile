export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=vi
export VISUAL=$EDITOR

# --- pyenv ---
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# --- homebrew ---
export HOMEBREW_NO_ANALYTIC=1
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- git ---
alias git=/opt/homebrew/bin/git
