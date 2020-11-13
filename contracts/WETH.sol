// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract WETH is ERC20 {    
    constructor() public ERC20('WETH', 'WETH') {
    }

    receive() external payable {
        require(msg.value > 0);
        _mint(msg.sender, msg.value);
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        if (recipient == address(this)) {
            _burn(msg.sender, amount);
            msg.sender.transfer(amount);
        } else {
            _transfer(_msgSender(), recipient, amount);
        }
        return true;
    }
}