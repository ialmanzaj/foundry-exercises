// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./DirtyMoney.sol";

contract Dealer {
    address[] public hackers;
    mapping(address => DirtyMoney) public userToDineroSucioContract;

    modifier notContractCaller() {
        if (msg.sender.code.length != 0) revert("Only EOA can call");
        _;
    }

    event NewHacker(address indexed _newHacker);

    function getNewInstance() public notContractCaller {
        address sender = msg.sender;
        userToDineroSucioContract[sender] = new DirtyMoney(sender);
    }

    function submitInstance() public {
        address sender = msg.sender;
        DirtyMoney userInstance = userToDineroSucioContract[sender];
        uint256 userBalance = userInstance.balanceOf(sender);

        if (isWinner(sender)) revert("You already won");
        if (userBalance != 0) revert("You haven't got them yet");

        hackers.push(sender);
        emit NewHacker(sender);
    }

    function isWinner(address _hacker) public view returns (bool) {
        return getWinner() == _hacker;
    }

    function getWinner() public view returns (address) {
        if (hackers.length == 0) return address(0);
        return hackers[0];
    }
}