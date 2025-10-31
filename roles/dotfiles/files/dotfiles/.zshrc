export XDG_CONFIG_HOME=$HOME/.config

# --- OS detection ---
OS_TYPE="$(uname -s)"

# --- homebrew (macOS only) ---
if [[ "$OS_TYPE" == "Darwin" ]]; then
  export HOMEBREW_NO_ANALYTIC=1
  if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    BREW_PREFIX="/opt/homebrew"
  elif [[ -f "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
    BREW_PREFIX="/usr/local"
  fi

  # Use Homebrew git on macOS
  [[ -n "$BREW_PREFIX" ]] && alias git="$BREW_PREFIX/bin/git"
fi

# --- pyenv ---
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv &> /dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# --- rust ---
. "$HOME/.cargo/env"

# --- local bin ---
export PATH=$HOME/.local/bin:$PATH

# --- go ---
export PATH=$PATH:$HOME/go/bin


# --- webstorm (macOS only) ---
if [[ "$OS_TYPE" == "Darwin" ]]; then
  export PATH=$PATH:/Applications/WebStorm.app/Contents/MacOS
fi

# --- fzf ---
if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
fi

# --- fnm ---
if command -v fnm &> /dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

# --- eza completion ---
if [[ "$OS_TYPE" == "Darwin" ]] && type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
elif [[ "$OS_TYPE" == "Linux" ]]; then
  # Linux package managers typically install to standard locations
  FPATH="/usr/share/zsh/site-functions:${FPATH}"
fi
autoload -Uz compinit
compinit

# --- zoxide ---
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# --- direnv ---
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# --- starship ---
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# --- zsh vim mode ---
bindkey -v

# --- zsh autosuggestions ---
if [[ "$OS_TYPE" == "Darwin" ]] && [[ -n "$BREW_PREFIX" ]]; then
  source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
elif [[ "$OS_TYPE" == "Linux" ]]; then
  # Try common Linux installation paths
  for plugin_path in \
    /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
    /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh; do
    [[ -f "$plugin_path" ]] && source "$plugin_path" && break
  done
fi

# --- zsh syntax highlighting ---
if [[ "$OS_TYPE" == "Darwin" ]] && [[ -n "$BREW_PREFIX" ]]; then
  source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
elif [[ "$OS_TYPE" == "Linux" ]]; then
  # Try common Linux installation paths
  for plugin_path in \
    /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
    /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; do
    [[ -f "$plugin_path" ]] && source "$plugin_path" && break
  done
fi

# --- zsh plugins ---
source $XDG_CONFIG_HOME/zsh/git.zsh
source $XDG_CONFIG_HOME/zsh/git.plugin.zsh

# --- zsh history ---
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt sharehistory
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# --- zsh key bindings ---
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# --- zsh aliases ---
alias ls='eza --icons always'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# --- lazygit ---
# Change directory after exiting lazygit
lg() {
  export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
  lazygit "$@"
  if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
    cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
    rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
  fi
}

# --- tmux ---
if [[ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" && "$TERM_PROGRAM" != "vscode" ]]; then
  if [ -z "$TMUX" ]; then
    if tmux has-session -t default 2>/dev/null; then
      tmux attach-session -t default
    else
      tmux new-session -s default
    fi
  fi
fi

# --- tmux sessionizer ---
function run_txs() {
  ~/.config/zsh/tmux-sessionizer ~/ ~/workspace/*/* ~/repos
}

zle -N run_txs
bindkey '^F' run_txs

# --- lvim (requires lvim setup) ---
export EDITOR="nvim"
export VISUAL=$EDITOR
alias vv=$EDITOR

# --- yazi ---
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# --- don't peek 🤫 ---
if [ -f ~/.config/zsh/.zshrc.local ]; then
  source ~/.config/zsh/.zshrc.local
fi


# --- bun ---
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions (portable - no hardcoded username)
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
