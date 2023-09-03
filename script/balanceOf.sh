#!/bin/bash

source .env

if [ "$#" -eq 0 ]; then
    echo "./balanceOf <TOKEN_ADDRESS>."
    exit 1
elif [ "$#" -eq 1 ]; then
    cast call $CONTRACT_WTRTOKEN "balanceOf(address)(uint256)" $1 --rpc-url $RPC_URL_LOCAL
else
    echo "Invalid parameters."
    exit 1
fi
