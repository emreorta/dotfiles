function rm_pacman_cache -d "Clear pacman cache"
    rm -rf "/var/cache/pacman/pkg/*"
end
