
# --- pyenv ---
eval "$(pyenv virtualenv-init -)"

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

# --- zsh git plugin ---
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
bindkey "^[f" forward-word
bindkey "^[b" backward-word
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
