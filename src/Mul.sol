// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MulExample {
    constructor() {}

    function exponential(uint256 x) public pure returns (uint256) {
        return x ** 2;
    }

    function multiply(uint256 x) public pure returns (uint256) {
        return x * x;
    }
}
