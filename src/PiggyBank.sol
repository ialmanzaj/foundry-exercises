// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract PiggyBank {
    address payable public owner;

    event Deposit(uint256 amount);
    event Withdrawl(uint256 amount);

    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdrawl() external onlyOwner {
        uint256 balance = address(this).balance;
        (bool sent,) = msg.sender.call{value: balance}("");
        require(sent, "Failed to send Ether");
        emit Withdrawl(balance);
        selfdestruct(payable(msg.sender));
    }
}
