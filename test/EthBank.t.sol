// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";
import "forge-std/Test.sol";

import {EthBank} from "../src/EthBank/EthBank.sol";
import {EthBankExploit, IEthBank} from "../src/EthBank/EthBankExploit.sol";

contract EthBankTest is Test {
    EthBank bank;
    EthBankExploit exploit;

    address bob = address(0x1);
    address alice = address(0x2);
    address attacker = address(0x3);

    function setUp() public {
        bank = new EthBank();
        exploit = new EthBankExploit(IEthBank(address(bank)));
    }

    function testAttack() public {
        hoax(bob, 2.5 ether);
        bank.deposit{value: 2.5 ether}();
        hoax(alice, 2 ether);
        bank.deposit{value: 2 ether}();
        hoax(attacker, 1 ether);
        exploit.pwn{value: 1 ether}();
        assertEq(alice.balance, 0);
        assertEq(bob.balance, 0);
        assertEq(address(bank).balance, 0);
    }
}
