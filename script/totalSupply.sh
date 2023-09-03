#!/bin/bash

source .env

if [ "$#" -eq 0 ]; then
    cast call $CONTRACT_WTRTOKEN "totalSupply()(uint256)" --rpc-url $RPC_URL_LOCAL
elif [ "$#" -eq 1 ]; then
    cast call $1 "totalSupply()(uint256)" --rpc-url $RPC_URL_LOCAL
elif [ "$#" -eq 2 ]; then
    cast call $1 "totalSupply()(uint256)" --rpc-url $2
else
    echo "Invalid parameters."
    exit 1
fi
