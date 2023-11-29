#!/bin/bash

USER_ID=${LOCAL_UID:-9001}
GROUP_ID=${LOCAL_GID:-9001}

echo "Starting with UID : $USER_ID, GID: $GROUP_ID"
useradd -u $USER_ID -o -m ubuntu
groupmod -g $GROUP_ID ubuntu
export HOME=/home/ubuntu

exec /usr/sbin/gosu ubuntu "$@"

