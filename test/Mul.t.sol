// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

//import "forge-std/console.sol";
import "../src/Mul.sol";

contract MulTest is Test {
    Mul multi;

    address bob = address(0x1223);

    function setUp() public {
        multi = new Mul();
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
