# README

There are only 2 files here.

* fish_erc20.sol :

  An ERC20 token, to buy and sell GoldenFish, which is created in the goldenfish_erc721.sol

* goldenfish_erc721.sol: 

  In this file, only a struct 'Fish' and 2 public functions: createFish and buyFish. Only the owner of the contract can call 'createFish', and others can call 'buyFish' from the current owner of the fish.