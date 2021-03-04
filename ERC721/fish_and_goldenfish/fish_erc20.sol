// SPDX-License-Identifier: MIT
  
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/v3.3.0/contracts/token/ERC20/ERC20Upgradeable.sol";

contract Fish is ERC20Upgradeable {
    //function initialize (string memory name, string memory symbol, uint256 _initialAmount) public initializer {
    constructor  (string memory name, string memory symbol, uint256 _initialAmount) public initializer {
        __ERC20_init(name, symbol);
        _mint(msg.sender, _initialAmount * (1 ether));
    }
}

