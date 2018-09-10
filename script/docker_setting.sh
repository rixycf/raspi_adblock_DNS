#!/bin/sh
INSTALL_SCRIPT_URL=https://get.docker.com/

curl -sSL "$INSTALL_SCRIPT_URL" | sh

sudo usermod -aG docker "$(whoami)"
