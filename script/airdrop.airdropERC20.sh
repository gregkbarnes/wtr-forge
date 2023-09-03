#!/bin/bash

# airdropERC20(address _token, address[] memory _recipients, uint256[] memory _amounts, uint256 _total)
# approve(address spender, uint256 amount) external returns (bool);

source .env

if [ "$#" -eq 0 ]; then
    cast send $CONTRACT_WTRTOKEN "approve(address, uint256)(bool)" $CONTRACT_AIRDROP 300 --rpc-url $RPC_URL_LOCAL --private-key $PK
    cast send $CONTRACT_AIRDROP "airdropERC20(address, address[], uint256[], uint256)()" $CONTRACT_WTRTOKEN $RECIPIENTS $AMOUNTS 300 --rpc-url $RPC_URL_LOCAL --private-key $PK
elif [ "$#" -eq 1 ]; then
    echo "error"
    exit 1
elif [ "$#" -eq 2 ]; then
    echo "error"
    exit 1
else
    echo "Invalid parameters."
    exit 1
fi
