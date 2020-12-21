#!/bin/bash

INSTALL_PATH="/opt/github-local-redirect"
GIT_REPO="https://github.com/vilhelmprytz/github-local-redirect.git"

output() {
    echo "- $1"
}

cmd() {
    output "run [$1]"
    $1
}

sudo_cmd() {
    output "sudo run [$1]"
    sudo $1
}

install() {
    present=false
    [ -d "$INSTALL_PATH" ] && present=true

    [ "$present" == false ] && sudo_cmd "git clone $GIT_REPO $INSTALL_PATH"
    [ "$present" == true ] && cmd "git pull $INSTALL_PATH"
    sudo_cmd "chown -R $(whoami):$(whoami) $INSTALL_PATH"

    cmd "rm -rf $INSTALL_PATH/.venv"
    cmd "mkdir $INSTALL_PATH/.venv"
    prev=$(pwd)
    cmd "cd $INSTALL_PATH"
    cmd "pipenv install"
    cmd "cd $prev"

    sudo_cmd "cp $INSTALL_PATH/github-local-redirect.service /etc/systemd/system/github-local-redirect.service"
    sudo_cmd "systemctl enable --now github-local-redirect"
    sudo_cmd "systemctl restart github-local-redirect"
}

main() {
    echo -n "- Install https://github.com/vilhelmprytz/github-local-redirect [y/N]: "
    read -r confirm
    [[ "$confirm" =~ [Yy] ]] && install
}

main
