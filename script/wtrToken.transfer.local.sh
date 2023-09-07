#!/bin/bash

# transfer(address to, uint256 amount)

source .env

if [ "$#" -eq 0 ]; then
    echo "error"
    exit 1
elif [ "$#" -eq 1 ]; then
    # cast send $CONTRACT_WTRTOKEN "transfer(address, uint256)()" $1 1 --rpc-url $RPC_URL_LOCAL --trezor
    cast send $CONTRACT_WTRTOKEN "transfer(address, uint256)()" $1 1 --rpc-url $RPC_URL_LOCAL --private-key $PK_ACC
    echo ""
    echo "Balance of $1:"
    cast call $CONTRACT_WTRTOKEN "balanceOf(address)(uint256)" $1 --rpc-url $RPC_URL_LOCAL
elif [ "$#" -eq 2 ]; then
    echo "error"
    exit 1
else
    echo "Invalid parameters."
    exit 1
fi
