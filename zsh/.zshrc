# Base Oh My Zsh config
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Load modular configs
[[ -f ~/aliases.zsh ]] && source ~/aliases.zsh
[[ -f ~/exports.zsh ]] && source ~/exports.zsh
