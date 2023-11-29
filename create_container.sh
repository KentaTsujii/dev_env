#!/bin/bash
#
# 開発環境コンテナ作成シェル
#

mkdir -p $HOME/program
docker stop dev_env
docker rm dev_env
docker create --name dev_env \
              -it \
              -v /var/run/docker.sock:/var/run/docker.sock \
              --mount type=bind,source=$HOME/program,target=/root/program \
              --mount type=bind,source=$HOME/.ssh,target=/root/.ssh \
              besuperengineer178/dev_env

