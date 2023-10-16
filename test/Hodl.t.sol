

// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/console.sol";
import "forge-std/Test.sol";

import "../src/Hold.sol";

contract HodlTest is Test {
    Hodl holder;

    address bob = address(0x1223);

    function setUp() public {
        vm.startPrank(bob);
        holder = new Hodl();
        vm.stopPrank();
    }



}