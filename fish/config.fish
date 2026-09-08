if status is-interactive
    # enable fzf, zoxide, pyenv keybindings
    fzf --fish | source
    zoxide init fish | source
    pyenv init - fish | source

    # enable atuin keybindings
    set -gx ATUIN_NOBIND true
    atuin init fish --disable-up-arrow | source
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search
end
