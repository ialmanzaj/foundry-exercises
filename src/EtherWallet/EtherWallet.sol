// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function withdraw(uint256 _amount) external onlyOwner {
        (bool sent,) = owner.call{value: _amount}("");
        require(sent, "Failed to send Ether");
    }
}
