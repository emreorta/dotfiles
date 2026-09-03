# dotfiles

Very personal configuration for neovim, fish, tmux, alacritty, and a bunch of other stuff.

## Install via script

Simply set the permission to execute the installation script and run it:

```sh
chmod +x install.sh
./install.sh
```

It should work on Arch-based Linux distros and macOS. Most dependencies are installed via the package manager (`pacman` and `yay` on Linux, `brew` on macOS) and `uv` installs the remaining. `dotbot` manages the symlinks.

That said, two caveats:

- `alacritty` on `brew` is deprecated. See [here](https://alacritty.org/#Installation) for installation methods.
- `brew` installation relies on `curl | sh`. Don't forget to check the script first before running it (even though it's the official, recommended method).

## Running Neovim in a Docker container

Make sure that `DOTFILES_DIR` is set to the dotfiles directory (e.g. `~/path/to/dotfiles/`) and contains `nvim` directory. If Git is needed inside the container, a Git config at `~/.gitconfig` needs to exist as well.

Build the image from the repo root:

```sh
docker build -f docker/nvim/Dockerfile -t nvim .
```

Head to the directory where you'd like to launch Neovim and run:

```sh
docker run --rm -it \
  -v "$PWD:$PWD" -w "$PWD" \
  -v "$DOTFILES_DIR/nvim:/root/.config/nvim" \
  -v "$HOME/.gitconfig:/root/.gitconfig:ro" \
  -v "$SSH_AUTH_SOCK:/ssh-agent" -e SSH_AUTH_SOCK=/ssh-agent \
  -v nvim-share:/root/.local/share/nvim \
  -v nvim-state:/root/.local/state/nvim \
  -e NVIM_IN_DOCKER=1 \
  nvim
```

Alternatively, the repo comes with a fish function named `nvimd` which can be used instead. Creating an alias would also work just fine.

A few things here:
- SSH agent needs to be set up to make git operations work inside the container. `eval (ssh-agent -c)` in fish and `eval $(ssh-agent)` in bash work just fine. On macOS with Docker Desktop, setting `SSH_AUTH_SOCK` to `/run/host-services/ssh-auth.sock` should work instead.
- SSH key(s) need(s) to be added via `ssh-add`.
- On first launch, the plugins and parsers are automatically installed and reused in later launched. LSPs need to be installed via Mason though.
