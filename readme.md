# autoamtic setup

## install or upgrade

```bash
curl -fsSL https://raw.githubusercontent.com/Avinash-sord12k/dotfiles/refs/heads/main/setup.sh | bash
```

## uninstall - remove all active configs

```bash
curl -fsSL https://raw.githubusercontent.com/Avinash-sord12k/dotfiles/refs/heads/main/uninstall.sh | bash -s uninstall
```

## cleanup - remove all files and source repo

```bash
curl -fsSL https://raw.githubusercontent.com/Avinash-sord12k/dotfiles/refs/heads/main/uninstall.sh | bash -s cleanup
```
---
# manual setup

## 1. clone this

## 2. run

```bash
stow -vt ~ tmux
stow -vt ~ zsh
stow -vt ~ nvim
```
