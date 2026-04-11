alias code='flatpak run com.visualstudio.code'
alias nvim='nvim --startuptime /tmp/nvim-st.log'
alias copy='xclip -selection clipboard'

lanmsg() {
  ssh x@192.168.0.110 \
  "DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send \"$*\""
}

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/a/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# dotnet tools
export PATH="$PATH:$HOME/.dotnet/tools"

# Add this to your ~/.bashrc or ~/.profile
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

eval "$(direnv hook zsh)"

fortune | cowsay -f tux | lolcat

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/a/google-cloud-sdk/path.zsh.inc' ]; then . '/home/a/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/a/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/a/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$HOME/.local/bin:$PATH"
