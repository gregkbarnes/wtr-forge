#!/bin/bash

# airdropERC20(address _token, address[] memory _recipients, uint256[] memory _amounts, uint256 _total)
# approve(address spender, uint256 amount) external returns (bool);

source .env

if [ "$#" -eq 0 ]; then
    cast send $CONTRACT_WTRTOKEN "approve(address, uint256)(bool)" $CONTRACT_AIRDROP $AIRDROP_TOTAL --rpc-url $RPC_URL_AVAX --private-key $PK_ACC
    cast send $CONTRACT_AIRDROP "airdropERC20(address, address[], uint256[], uint256)()" $CONTRACT_WTRTOKEN $RECIPIENTS $AIRDROP_AMOUNTS $AIRDROP_TOTAL --rpc-url $RPC_URL_AVAX --private-key $PK_ACC
else
    echo "Invalid parameters."
    exit 1
fi
