#!/bin/sh

if [ "$#" -eq  "0" ]
  then
    CMD="bash"
 else
  CMD=${@}
fi

docker-compose run --rm backend ${CMD}
