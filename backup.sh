#!/bin/bash
#
# 現在の設定のバックアップを取得するシェル
#

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
BACKUP_DIR=${SCRIPT_DIR}/backup
mkdir -p ${BACKUP_DIR}
mkdir -p ${BACKUP_DIR}/.config
cp -rf ~/.config/lazygit ${BACKUP_DIR}/.config/lazygit
cp -rf ~/.config/nvim ${BACKUP_DIR}/.config/nvim
cp -rf ~/.config/sheldon ${BACKUP_DIR}/.config/sheldon
cp -f ~/.zshrc ${BACKUP_DIR}/.zshrc
cp -rf ~/.config/starship.toml ${BACKUP_DIR}/.config/startship.toml

