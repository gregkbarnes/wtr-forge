#!/bin/bash

# transfer(address to, uint256 amount)

source .env

if [ "$#" -eq 2 ]; then
    cast send $CONTRACT_WTRTOKEN "unfreeze(address)()" $1 --rpc-url $RPC_URL_AVAX --private-key $PK_PAUSE
    cast send $CONTRACT_WTRTOKEN "transfer(address, uint256)()" $1 $2 --rpc-url $RPC_URL_AVAX --private-key $PK_ACC
    cast send $CONTRACT_WTRTOKEN "freeze(address)()" $1 --rpc-url $RPC_URL_AVAX --private-key $PK_PAUSE
    echo ""
    echo "Balance of $1:"
    cast call $CONTRACT_WTRTOKEN "balanceOf(address)(uint256)" $1 --rpc-url $RPC_URL_AVAX
else
    echo "Invalid parameters. Correct usage should be: wtrToken.transferAndFreeze.avax.sh <address> <amount>."
    exit 1
fi