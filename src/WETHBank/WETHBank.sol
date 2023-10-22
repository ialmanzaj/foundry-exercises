pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IERC20Permit is IERC20 {
    function permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s)
        external;
}

/*
Alice has 10 WETH and deposited 1 WETH into ERC20Bank.

Thinking she might deposit more later, she has set inifinite approval on ERC20Bank.

In other words, ERC20Bank can spend unlimited amount of WETH owned by Alice.

1. get all WETH owned by alice
2
*/

contract WETHBank {
    IERC20Permit public immutable token;
    mapping(address => uint256) public balanceOf;

    constructor(address _token) {
        token = IERC20Permit(_token);
    }

    function depositWithPermit(
        address owner,
        address spender,
        uint256 amount,
        uint256 deadline,
        //signature params
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        // approval with signature
        token.permit(owner, spender, amount, deadline, v, r, s);
        // transfer tokens from owner to contract
        token.transferFrom(owner, address(this), amount);
        // update balance
        balanceOf[spender] += amount;
    }

    function deposit(uint256 _amount) external {
        token.transferFrom(msg.sender, address(this), _amount);
        balanceOf[msg.sender] += _amount;
    }

    function withdraw(uint256 _amount) external {
        balanceOf[msg.sender] -= _amount;
        token.transfer(msg.sender, _amount);
    }
}
