#!/bin/bash

_DIR0=$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)
_DIR=$(cd "$_DIR0/.."; pwd)

. "${_DIR0}/.params.sh"
cd "${_DIR}"

# for windows
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
  export MSYS_NO_PATHCONV=1
fi

if [ "$1" = "docker" ]; then
    docker run --name docker_dump -it --rm \
    -v "${_DIR}/dump:/data/dump" \
    mongo mongodump --uri "${URI}" --out /data/dump 

    # NOTE: replicaSet運用で domainの指定できないホスト名を利用する場合 /etc/hosts に相当する設定が必要
    # mongoDB内のホスト名と、一致させる必要があるため
    # 試した感じ、portは外部公開しているものでOK
    # 
    # HOST_IP="1.2.3.4"
    # docker run --name docker_dump -it --rm \
    #   --add-host mongo01:${HOST_IP} \
    #   --add-host mongo02:${HOST_IP} \
    #   -v "${_DIR}/dump:/data/dump" \
    #   mongo mongodump --uri "mongodb://mongo01:27019,mongo02:27020/?replicaSet=rs0" --out /data/dump 
elif [ "$1" = "compose" ]; then

    docker compose run --name docker_dump -it --rm \
    -v "${_DIR}/dump:/data/dump" \
    mongo01 mongodump --uri "${URI}" --out /data/dump 

fi
