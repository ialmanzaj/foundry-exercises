// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/console.sol";
import "forge-std/Test.sol";

import {Dealer} from "../src/DirtyMoney/Dealer.sol";
import {DirtyMoney} from "../src/DirtyMoney/DirtyMoney.sol";

contract DealerTest is Test {
    Dealer dealer;
    DirtyMoney money;
    
    address bob = address(0x1);
    address mary = address(0x22222222);

    function setUp() public {
        vm.startPrank(bob);
        dealer = new Dealer();
        vm.stopPrank();
    }

    function testSubmit() public {
        vm.startPrank(bob);
        dealer.getNewInstance();
        money = dealer.userToDineroSucioContract(bob);
        uint256 balance = money.balanceOf(bob);

        money.approve(bob, balance);
        money.transferFrom(bob, mary, balance);
        dealer.submitInstance();

        assertEq(money.balanceOf(bob), 0);
        assertEq(money.balanceOf(mary), balance);
        vm.stopPrank();
    }
}
