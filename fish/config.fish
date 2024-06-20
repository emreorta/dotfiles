# add fish to $PATH
fish_add_path /opt/homebrew/bin

# link python to default python3.x
fish_add_path /opt/homebrew/opt/python/libexec/bin

# enable fzf keybindings for fish
fzf --fish | source

# as a safeguard to make sure that fish works within the integrated terminal of vscode
string match -q "$TERM_PROGRAM" "vscode" and . (code --locate-shell-integration-path fish)

# prevent python from creating .pyc, .pyo, and __pycache__
set -x PYTHONDONTWRITEBYTECODE True

# nvim > vim
set -gx EDITOR nvim 

# useful aliases
alias k="kubectl"

set -gx NVIM_COLORSCHEME "nightfox"
