// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/console.sol";
import "forge-std/Test.sol";

import {MulExample} from "../src/Mul.sol";

contract MulTest is Test {
    MulExample multi;

    function setUp() public {
        multi = new MulExample();
    }

    function testMul() public {
        uint res = multi.multiply(2);
        assertEq(res, 4);
    }
    
    function testExp() public {
        uint res = multi.exponential(2);
        assertEq(res, 4);
    }
}
