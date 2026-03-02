#!/usr/bin/env bash

set -e

# ==============================
# CONFIG (EDIT THIS)
# ==============================
REPO_URL="https://github.com/Avinash-sord12k/dotfiles.git"
DOTFILES_DIR="$HOME/projects/personal/dotfiles"
BRANCH="main"

# ==============================
# HELPERS
# ==============================
log() {
  echo "[dotfiles] $1"
}

ensure_stow() {
  if command -v stow >/dev/null 2>&1; then
    log "GNU Stow already installed"
    return
  fi

  log "Installing GNU Stow..."

  if command -v apt >/dev/null 2>&1; then
    sudo apt update && sudo apt install -y stow
  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Sy --noconfirm stow
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y stow
  else
    log "Package manager not supported. Install stow manually."
    exit 1
  fi
}

clone_or_update_repo() {
  if [ ! -d "$DOTFILES_DIR/.git" ]; then
    log "Cloning dotfiles repo..."
    mkdir -p "$(dirname "$DOTFILES_DIR")"
    git clone -b "$BRANCH" "$REPO_URL" "$DOTFILES_DIR"
  else
    log "Updating existing repo..."
    git -C "$DOTFILES_DIR" fetch origin
    git -C "$DOTFILES_DIR" checkout "$BRANCH"
    git -C "$DOTFILES_DIR" pull origin "$BRANCH"
  fi
}

get_packages() {
  cd "$DOTFILES_DIR"
  find . -maxdepth 1 -mindepth 1 -type d ! -name ".git" -printf "%f\n"
}

install_links() {
  log "Installing stow packages..."
  cd "$DOTFILES_DIR"

  PACKAGES=$(get_packages)

  for pkg in $PACKAGES; do
    log "Stowing: $pkg"
    stow -vt "$HOME" "$pkg"
  done

  log "Install complete."
}

uninstall_links() {
  log "Removing stow links..."
  cd "$DOTFILES_DIR"

  PACKAGES=$(get_packages)

  for pkg in $PACKAGES; do
    log "Unstowing: $pkg"
    stow -Dvt "$HOME" "$pkg"
  done

  log "Uninstall complete."
}

cleanup() {
  log "Starting cleanup..."

  if [ -d "$DOTFILES_DIR" ]; then
    log "Removing stow links..."
    uninstall_links || true

    log "Removing dotfiles repository..."
    rm -rf "$DOTFILES_DIR"
  else
    log "Dotfiles directory not found, skipping."
  fi

  log "Cleanup complete."
}

# ==============================
# ENTRY
# ==============================

case "${1:-install}" in
  install)
    ensure_stow
    clone_or_update_repo
    install_links
    ;;
  uninstall)
    ensure_stow
    uninstall_links
    ;;
  cleanup)
    ensure_stow
    cleanup
    ;;
  *)
    echo "Usage: $0 [install|uninstall]"
    exit 1
    ;;
esac
