# Starship
eval "$(starship init zsh)"

# OMZ
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

zstyle ':omz:update' mode reminder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  git
  common-aliases
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
