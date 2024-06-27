# add fish to $PATH
fish_add_path /opt/homebrew/bin

# link python to default python3.x
fish_add_path /opt/homebrew/opt/python/libexec/bin

# enable fzf keybindings for fish
fzf --fish | source

# enable atuin keybindings for fish
set -gx ATUIN_NOBIND "true"
atuin init fish --disable-up-arrow | source
bind \cr _atuin_search
bind -M insert \cr _atuin_search

# as a safeguard to make sure that fish works within the integrated terminal of vscode
string match -q "$TERM_PROGRAM" "vscode" and . (code --locate-shell-integration-path fish)

# prevent python from creating .pyc, .pyo, and __pycache__
set -x PYTHONDONTWRITEBYTECODE True

# nvim > vim
set -gx EDITOR nvim 

# NVIM_COLORSCHEME is used in ../nvim/lua/plugins/colors.lua for colorscheme
set -gx NVIM_COLORSCHEME "nightfox"

# not really needed but kind of useful to have
set -gx VIRTUALENVS_HOME "~/.virtualenvs"

# useful aliases
alias k="kubectl"
alias vim="nvim"
