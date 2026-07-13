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
