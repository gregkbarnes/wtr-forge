#!/bin/bash

source .env

if [ "$#" -eq 1 ]; then
    cast call $CONTRACT_WTRTOKEN "balanceOf(address)(uint256)" $1 --rpc-url $RPC_URL_LOCAL
else
    echo "./balanceOf <TOKEN_ADDRESS>."
    exit 1
fi
