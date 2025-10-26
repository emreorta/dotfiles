# add fish and python to $PATH
fish_add_path $(which fish)
fish_add_path $(which python3)

set -gx PYTHONDONTWRITEBYTECODE True
set -gx PIP_REQUIRE_VIRTUALENV False
set -gx VIRTUALENVS_HOME $HOME/.virtualenvs
set -gx PIP_DOWNLOAD_CACHE $HOME/.pip/cache

# nvim > vim
set -gx EDITOR nvim

# NVIM_COLORSCHEME is used in ../nvim/lua/plugins/colors.lua for colorscheme
set -gx NVIM_COLORSCHEME "kanso-ink"

# useful aliases
alias vim="nvim"

# enable fzf, zoxide, pyenv keybindings
fzf --fish | source
zoxide init fish | source
pyenv init - fish | source

# enable atuin keybindings
set -gx ATUIN_NOBIND "true"
atuin init fish --disable-up-arrow | source
bind \cr _atuin_search
bind -M insert \cr _atuin_search

# abbreviations
# git stuff
abbr -a -- gco "git checkout"
abbr -a -- gcob "git checkout -b"
abbr -a -- gcom "git checkout main"
abbr -a -- gplo "git pull origin"
abbr -a -- gpsf "git push --force-with-lease"
abbr -a -- grpo "git remote prune origin"
abbr -a -- grbi "git rebase -i HEAD~"
abbr -a -- gbd "git branch -D"

# k8s stuff
abbr -a -- k "kubectl"
