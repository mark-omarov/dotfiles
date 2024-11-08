export XDG_CONFIG_HOME=$HOME/.config

# --- homebrew ---
export HOMEBREW_NO_ANALYTIC=1
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- pyenv ---
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# --- git ---
alias git=/opt/homebrew/bin/git

# --- rust ---
. "$HOME/.cargo/env"

# --- local bin ---
export PATH=$HOME/.local/bin:$PATH

# --- lvim (requires lvim setup) ---
export EDITOR=lvim
export VISUAL=$EDITOR

# --- go ---
export PATH=$PATH:$HOME/go/bin
