set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

# python stuff
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx PIP_REQUIRE_VIRTUALENV 0
set -gx VIRTUALENVS_HOME $HOME/.virtualenvs
set -gx PIP_DOWNLOAD_CACHE $HOME/.pip/cache

# disable auto updates in homebrew
set -gx HOMEBREW_NO_AUTO_UPDATE 1

# set alacritty as the default terminal
set -gx TERMINAL alacritty

# nvim > vim
set -gx EDITOR nvim

# NVIM_COLORSCHEME is used in ../nvim/lua/plugins/colors.lua for colorscheme
set -gx NVIM_COLORSCHEME "no-clown-fiesta-dark"
