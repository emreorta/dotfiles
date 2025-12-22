function drmip -d "Remove Docker images with a prefix"
    docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' | grep $argv)
end
