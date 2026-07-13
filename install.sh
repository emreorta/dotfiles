#!/usr/bin/env bash
set -euo pipefail

case "$(uname -s)" in
Darwin)
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew bundle install
  ;;
Linux)
  sudo pacman -S --needed --noconfirm \
    fish neovim tmux alacritty fzf zoxide pyenv atuin bat fd \
    eza fuzzel greetd tree-sitter-cli difftastic k9s kubectx \
    uv rust
  yay -S --needed --noconfirm dust greetd-tuigreet evremap-git
  ;;
esac

uv tool install dotbot
dotbot -c install.conf.yaml -v

uv tool install virtualfish
fish -c "vf new neovim && \
  vf activate neovim && \
  pip install --upgrade pynvim && \
  python -c 'import pynvim' && \
  vf deactivate"
