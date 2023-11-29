#!/bin/bash
#
# 開発環境コンテナ作成シェル
#

mkdir -p $HOME/program
docker stop dev_env
docker rm dev_env
docker run --name dev_env \
              -it \
              -v /var/run/docker.sock:/var/run/docker.sock \
              --mount type=bind,source=$HOME/program,target=/home/ubuntu/program \
              --mount type=bind,source=$HOME/.ssh,target=/home/ubuntu/.ssh \
              -e LOCAL_UID=$(id -u $USER) \
              -e LOCAL_GID=$(id -g $USER) \
              besuperengineer178/dev_env

