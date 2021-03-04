// SPDX-License-Identifier: MIT
  
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.3.0/contracts/math/SafeMath.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.3.0/contracts/utils/introspection/IERC165.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.3.0/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.3.0/contracts/token/ERC20/IERC20.sol";

contract GoldenFish is ERC721 {
    using SafeMath for uint256;
    
    struct Fish {
        uint256 _birthTime;
        uint256 _genes;
        uint256 _price;
    }
    
    address _owner;
    address _token;
    
    Fish [] fishes;
    
    
    constructor (string memory name, string memory symbol, address token) ERC721(name, symbol) public {
        _owner = msg.sender;
        _token = token;
    }
    
    function createFish(uint256 genes, uint256 price) external returns (uint) {
        require(_owner == msg.sender);

        Fish memory _fish = Fish({
            _genes: genes,
            _birthTime: now,
            _price: price
        });
        
        fishes.push(_fish);
        uint256 newFishId = fishes.length - 1;

        _safeMint(_owner, newFishId);

        return newFishId;
    }

    function buyFish(uint256 fishID) external {
        address owner = ownerOf(fishID);
        IERC20(_token).transferFrom(msg.sender, owner, fishes[fishID]._price);
        
        _safeTransfer(owner, msg.sender, fishID, "");
    }
}

