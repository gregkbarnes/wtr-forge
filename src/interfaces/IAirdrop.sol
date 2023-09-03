// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface Airdrop {
    function airdropERC20(address _token, address[] memory _recipients, uint256[] memory _amounts, uint256 _total)
        external;
    function airdropETH(address[] memory _recipients, uint256[] memory _amounts) external payable;
}
