#!/bin/bash

# freeze(address account)

source .env

if [ "$#" -eq 0 ]; then
    echo "error"
    exit 1
elif [ "$#" -eq 1 ]; then
    cast send $CONTRACT_WTRTOKEN "freeze(address)()" "0x4dA5095C9D2e8c802dEA08A03dA0C7c6810D36c7" --rpc-url $RPC_URL_LOCAL --private-key $PK_PAUSE
elif [ "$#" -eq 2 ]; then
    echo "error"
    exit 1
else
    echo "Invalid parameters."
    exit 1
fi
