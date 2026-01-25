
# Docker exec shortcut with container name completion
dexec() { docker exec -it "$1" bash; }

_docker_container_names() {
  compadd $(docker ps --format '{{.Names}}')
}
compdef _docker_container_names dexb



