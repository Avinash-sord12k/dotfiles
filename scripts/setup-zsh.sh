#!/bin/bash
set -e

# Replace with your GitHub username + repo
REPO_URL="https://raw.githubusercontent.com/Avinash-sord12k/dotfiles/main/zsh"

echo "🔄 Updating system..."
sudo apt update -y && sudo apt upgrade -y

echo "📦 Installing Zsh..."
sudo apt install zsh git wget curl -y

echo "📝 Setting Zsh as default shell..."
chsh -s $(which zsh)

echo "✨ Installing Oh My Zsh..."
export RUNZSH=no
export CHSH=no
sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

echo "🔌 Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions || true

echo "🔌 Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting || true

echo "⚙️  Downloading preconfigured zsh files..."
curl -fsSL $REPO_URL/.zshrc -o ~/.zshrc
curl -fsSL $REPO_URL/aliases.zsh -o ~/aliases.zsh
curl -fsSL $REPO_URL/exports.zsh -o ~/exports.zsh

echo "✅ Zsh setup complete! Run 'exec zsh' to reload."

source ~/.zshrc