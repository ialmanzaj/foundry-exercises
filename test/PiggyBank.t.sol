// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/console.sol";
import "forge-std/Test.sol";

import "../src/PiggyBank.sol";


contract PiggyBankTest is Test {
    PiggyBank bank;

    address bob = address(0x1223);

    function setUp() public {
        vm.startPrank(bob);
        bank = new PiggyBank();
        vm.stopPrank();
    }
    
    function _send(uint amount) private {
        (bool ok, ) = address(bank).call{value: amount}("");
        require(ok, "send ETH failed");
         console.log("contract owner", bank.owner);
    }

    function testWithdrawl() public {
        deal(address(1), 10);
        vm.prank(address(1));
        _send(10);

        hoax(address(1), 456);
         _send(456);
    }
}
