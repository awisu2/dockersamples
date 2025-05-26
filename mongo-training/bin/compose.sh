#!/bin/bash

_DIR0=$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)
_DIR=$(cd "$_DIR0/.."; pwd)

cd "${_DIR}"

if [ "$1" = "up" ]; then
    docker compose up
elif [ "$1" = "up2" ]; then
    docker compose -f docker-compose2.yml up
elif [ "$1" = "down" ]; then
    docker compose down
else
    echo "please set args"
fi

