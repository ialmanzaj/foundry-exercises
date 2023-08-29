// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MulExample {

    constructor() {

    }

    function exponential(uint x) public pure returns (uint) {
        return x ** 2;
    }

    function multiply(uint x) public pure returns (uint) {
        return  x * x;
    }
}
