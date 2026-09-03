function nvimd -d "Neovim in Docker"
  # this reflects the directory based gitconfig setup
  if string match -q "$HOME/dev/work/*" "$PWD"
    set -f cfg ~/.gitconfig-work
  else
    set -f cfg ~/.gitconfig-personal
  end
  set -f name (git config -f $cfg user.name)
  set -f email (git config -f $cfg user.email)

  docker run --rm -it \
    -v "$PWD:$PWD" -w "$PWD" \
    -v "$DOTFILES_DIR/nvim:/root/.config/nvim" \
    -v "$HOME/.gitconfig:/root/.gitconfig:ro" \
    -v "$SSH_AUTH_SOCK:/ssh-agent" -e SSH_AUTH_SOCK=/ssh-agent \
    -v nvim-share:/root/.local/share/nvim \
    -v nvim-state:/root/.local/state/nvim \
    -e NVIM_IN_DOCKER=1 \
    -e GIT_AUTHOR_NAME="$name" -e GIT_AUTHOR_EMAIL="$email" \
    -e GIT_COMMITTER_NAME="$name" -e GIT_COMMITTER_EMAIL="$email" \
    nvim
end
