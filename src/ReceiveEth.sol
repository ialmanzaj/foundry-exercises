// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ReceiveEther {
  
    // Function to receive Ether. 
    //msg.data must be empty
    receive() external payable {}
}
