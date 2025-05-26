#!/bin/bash

_DIR0=$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)
_DIR=$(cd "$_DIR0/.."; pwd)

. "${_DIR0}/.params.sh"
cd "${_DIR}"

if [ "$1" = "root" ]; then
    # 認証機能のテストなのでファイルは２のほうが好ましいが、service名が同じためこれでも動く
    docker compose -f docker-compose.yml exec mongo01 mongosh -u ${USER} -p ${PASSWORD}

    # より正確にはこちら。ただadmin以外にユーザを作ることは少ないので不要(default: admin)
    # docker compose -f docker-compose.yml exec mongo01 mongosh -u ${USER} -p ${PASSWORD} --authenticationDatabase ${AUTHDB}

elif [ "$1" = "rootstring" ]; then
    docker compose -f docker-compose.yml exec mongo01 mongosh "mongodb://${USER}:${PASSWORD_FORURL}@localhost:27017/"

    # より正確にはこちら。認証dbを末尾に追加する必要あり(default: admin)
    # docker compose -f docker-compose.yml exec mongo01 mongosh "mongodb://${USER}:${PASSWORD_FORURL}@localhost:27017/${AUTHDB}"

else
    docker compose -f docker-compose.yml exec mongo01 mongosh
fi