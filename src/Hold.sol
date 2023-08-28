// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Hodl {
    uint256 private constant HODL_DURATION = 3 * 365 days;

    mapping(address => uint256) public balanceOf;
    mapping(address => uint256) public lockedUntil;

    function deposit() external payable {
        // condition greater than zero
        require(msg.value > 0, "not enought money");
        // update user balance
        balanceOf[msg.sender] += msg.value;
        lockedUntil[msg.sender] = block.timestamp + HODL_DURATION;
    }

    function withdraw() external {
        require(block.timestamp >= lockedUntil[msg.sender], "wait 3 year");
        require(balanceOf[msg.sender] > 0, "dont have money");
        uint256 balance = balanceOf[msg.sender];
        balanceOf[msg.sender] = 0;

        (bool sent,) = payable(msg.sender).call{value: balance}("");
        require(sent, "Failed to send Ether");
    }
}
