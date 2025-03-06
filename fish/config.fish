# add fish to $PATH
fish_add_path /opt/homebrew/bin

# link python to default python3.x
fish_add_path $(which python3)

# as a safeguard to make sure that fish works within the integrated terminal of vscode
string match -q "$TERM_PROGRAM" "vscode" and . (code --locate-shell-integration-path fish)

# prevent python from creating .pyc, .pyo, and __pycache__
set -gx PYTHONDONTWRITEBYTECODE True
set -gx PIP_REQUIRE_VIRTUALENV True
set -gx VIRTUALENVS_HOME "~/.virtualenvs"
set -gx PIP_DOWNLOAD_CACHE $HOME/.pip/cache

# nvim > vim
set -gx EDITOR nvim 

# NVIM_COLORSCHEME is used in ../nvim/lua/plugins/colors.lua for colorscheme
set -gx NVIM_COLORSCHEME "nightfox"

# useful aliases
alias vim="nvim"

# enable fzf and zoxide keybindings
fzf --fish | source
zoxide init fish | source

# enable atuin keybindings
set -gx ATUIN_NOBIND "true"
atuin init fish --disable-up-arrow | source
bind \cr _atuin_search
bind -M insert \cr _atuin_search

# abbreviations
# git stuff
abbr -a -- gco "git checkout"
abbr -a -- gcob "git checkout -b"
abbr -a -- ga "git add"
abbr -a -- gpl "git pull"
abbr -a -- gplo "git pull origin"
abbr -a -- gps "git push"
abbr -a -- gpso "git push origin"
abbr -a -- gpst "git push --tags"
abbr -a -- grpo "git remote prune origin"
abbr -a -- grbi "git rebase -i HEAD~"
abbr -a -- gbd "git branch -D"

# tmux stuff
abbr -a -- tmns "tmux new -s"
abbr -a -- tmat "tmux attach -t"

# k8s stuff
abbr -a -- k "kubectl"
