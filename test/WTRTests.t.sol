// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {WTRToken} from "src/interfaces/IWTRToken.sol";
import {Airdrop} from "src/interfaces/IAirdrop.sol";

contract WTRTests is Test {
    string public RPC_URL_LOCAL;
    WTRToken public WTR_TOKEN;
    Airdrop public AIRDROP;
    address WTR_TOKEN_ADDRESS;
    address AIRDROP_ADDRESS;
    address WTR_WHALE;

    function setUp() public {
        RPC_URL_LOCAL = vm.envString("RPC_URL_LOCAL");
        WTR_TOKEN_ADDRESS = vm.envAddress("CONTRACT_WTRTOKEN");
        AIRDROP_ADDRESS = vm.envAddress("CONTRACT_AIRDROP");
        WTR_WHALE = vm.envAddress("WTR_WHALE");

        vm.createSelectFork(RPC_URL_LOCAL);

        WTR_TOKEN = WTRToken(WTR_TOKEN_ADDRESS);
        AIRDROP = Airdrop(AIRDROP_ADDRESS);
    }

    function convertStringToAddress(string memory _addressString) public pure returns (address) {
        return address(bytes20(bytes(_addressString)));
    }

    function test__wtrToken__transfer() public {
        uint256 amountToTransfer = 100;
        uint256 wtrBalanceBefore = WTR_TOKEN.balanceOf(WTR_WHALE);

        vm.prank(WTR_WHALE);
        WTR_TOKEN.transfer(WTR_TOKEN_ADDRESS, amountToTransfer);

        uint256 wtrBalanceAfter = WTR_TOKEN.balanceOf(WTR_WHALE);

        assertEq(
            wtrBalanceAfter + amountToTransfer,
            wtrBalanceBefore,
            "Sender's balance before + amount transferred should be = Balance after."
        );
    }

    struct AidropTargets {
        address[] recipients;
        uint256[] amounts;
    }

    AidropTargets airdropTargets;

    function test__airDrop__airdropERC20() public {
        address user0 = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266; // anvil account 0
        address user1 = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8; // anvil account 1
        uint256 amountsTotal = 0;

        vm.startPrank(WTR_WHALE);

        WTR_TOKEN.approve(AIRDROP_ADDRESS, 300);

        airdropTargets.recipients = [user0, user1];

        airdropTargets.amounts = [100, 200];

        for (uint256 i = 0; i < airdropTargets.amounts.length; i++) {
            amountsTotal += airdropTargets.amounts[i];
        }

        AIRDROP.airdropERC20(WTR_TOKEN_ADDRESS, airdropTargets.recipients, airdropTargets.amounts, amountsTotal);

        vm.stopPrank();

        uint256 balanceAfter0 = WTR_TOKEN.balanceOf(user0);
        uint256 balanceAfter1 = WTR_TOKEN.balanceOf(user1);

        // This is a really lazy and confusing test
        assertEq(
            balanceAfter0 + balanceAfter1, amountsTotal, "Sum of new balances should be same as amount airdropped."
        );
        assertEq(
            amountsTotal - balanceAfter0,
            balanceAfter1,
            "Total sent - user0's balancer after the airdrop should be equal to user1's balance after the airdrop."
        );
        assertEq(
            amountsTotal - balanceAfter1,
            balanceAfter0,
            "Total sent - user1's balancer after the airdrop should be equal to user0's balance after the airdrop."
        );
    }
}
