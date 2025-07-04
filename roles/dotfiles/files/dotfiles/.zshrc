export XDG_CONFIG_HOME=$HOME/.config

# --- homebrew ---
export HOMEBREW_NO_ANALYTIC=1
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- pyenv ---
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# --- git ---
alias git=/opt/homebrew/bin/git

# --- rust ---
. "$HOME/.cargo/env"

# --- local bin ---
export PATH=$HOME/.local/bin:$PATH

# --- go ---
export PATH=$PATH:$HOME/go/bin


#--- webstorm ---
export PATH=$PATH:/Applications/WebStorm.app/Contents/MacOS

# --- fzf ---
source <(fzf --zsh)

# --- fnm ---
eval "$(fnm env --use-on-cd)"

# --- eza ---
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# --- zoxide ---
eval "$(zoxide init zsh --cmd cd)"

# --- direnv ---
eval "$(direnv hook zsh)"

# --- starship ---
eval "$(starship init zsh)"

# --- zsh vim mode ---
bindkey -v

# --- zsh autosuggestions ---
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- zsh syntax highlighting ---
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
export EDITOR="lvim"
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


# bun completions
[ -s "/Users/mark-omarov/.bun/_bun" ] && source "/Users/mark-omarov/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
