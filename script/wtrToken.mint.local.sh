#!/bin/bash

# mint(address to, uint256 amount) external;

source .env

if [ "$#" -eq 2 ]; then
    cast send $CONTRACT_WTRTOKEN "mint(address, uint256)()" $1 $2 --rpc-url $RPC_URL_LOCAL --private-key $PK_MINT
else
    echo "./mint <TO_ADDRESS> <AMOUNT>"
    exit 1
fi
