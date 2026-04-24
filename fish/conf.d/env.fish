# python stuff
set -gx PYTHONDONTWRITEBYTECODE True
set -gx PIP_REQUIRE_VIRTUALENV False
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
