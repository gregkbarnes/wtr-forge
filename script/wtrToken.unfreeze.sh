#!/bin/bash

# unfreeze(address account)

source .env

if [ "$#" -eq 0 ]; then
    echo "error"
    exit 1
elif [ "$#" -eq 1 ]; then
    cast send $CONTRACT_WTRTOKEN "unfreeze(address)()" $1 --rpc-url $RPC_URL_LOCAL --private-key $PK_PAUSE
elif [ "$#" -eq 2 ]; then
    echo "error"
    exit 1
else
    echo "Invalid parameters."
    exit 1
fi
