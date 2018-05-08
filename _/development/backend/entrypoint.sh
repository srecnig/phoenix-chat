#!/bin/bash -e

source /etc/environment

cd /chat/backend

if [ "$#" -eq  "0" ]
  then
    echo "No argument(s) supplied"
    exit 1;
else
  CMD=${1}
fi

if [ "$CMD" == "bash" ]; then
    echo "Welcome to the dev-shell as unpriviledged user '${HOSTUSER}'"
    su $HOSTUSER -s /bin/bash
elif [ "$CMD" == "rootshell" ]; then
    echo "Welcome to the dev-shell, as root. You might want to become '${HOSTUSER}' when touching application files."
    bash
else
    echo "Running ${*} as '${HOSTUSER}'"
    su $HOSTUSER -c "/chat/backend/run.sh ${*}"
fi
