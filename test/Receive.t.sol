// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/console.sol";
import "forge-std/Test.sol";

import {ReceiveEther} from "../src/ReceiveEth.sol";

contract ReceiveEtherTest is Test {
    ReceiveEther wallet = new ReceiveEther();
    address bob = address(0x1);

    function testReceiveDataEmpty() public {
        hoax(bob, 1 ether);
        // sending ETH from bob to wallet
        (bool ok,) = address(wallet).call{value: 1 ether}("");

        assertEq(bob.balance, 0);
        assertEq(address(wallet).balance, 1 ether);
    }
}
