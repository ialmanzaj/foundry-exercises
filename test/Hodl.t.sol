
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/console.sol";
import "forge-std/Test.sol";

import "../src/Hodl.sol";

contract HodlTest is Test {
     //const HODL_DURATION = 3 * 365 * 24 * 3600
    uint private constant CURRENT = 24 * 3600;
    uint256 private constant HODL_DURATION = 3 * 365 * CURRENT;
    Hodl holder;

    address bob = address(0x1223);

    function setUp() public {
        vm.startPrank(bob);
        holder = new Hodl();
        vm.stopPrank();
    }

    function testDeposit() public {
        vm.startPrank(bob);
        //and give it some money
        vm.deal(bob, 0.1 ether);
        holder.deposit{value: 0.1 ether}();
        vm.stopPrank();
        console.log("locked: %s", holder.lockedUntil(bob));
        assertEq(holder.balanceOf(bob), 0.1 ether);
        console.log("timestamp: %s", block.timestamp);
        console.log("CURRENT: %s", CURRENT);
        console.log("HODL_DURATION: %s", HODL_DURATION);
        assertEq(holder.lockedUntil(bob), block.timestamp + HODL_DURATION);
    }

    function testFailWithdrawLockNotExpired() public {
         vm.startPrank(bob);
        //and give it some money
        vm.deal(bob, 0.1 ether);
        holder.deposit{value: 0.1 ether}();
        vm.stopPrank();
        holder.withdraw();
    }


    function testWithdraw() public {
        holder.withdraw();
    }


}