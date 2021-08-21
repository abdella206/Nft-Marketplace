// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract NFT is ERC721URIStorage {

    constructor(address marketplaceAddress) ERC721("Metaverse Tokens", "METT") {
    contractAddress = marketplaceAddress;
    }

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress;


    function createToken(string memory tokenURI) public returns (uint) {
    // increment the token Id  
        _tokenIds.increment();
    
    //  Get current value of token Id
        uint256 newItemId = _tokenIds.current();

    // start to min the token
        _mint(msg.sender, newItemId);

    // set the token uri this function was from ERC721URIStorage line 6    
        _setTokenURI(newItemId,tokenURI);

    // Give market place the approval to transact token between users from within another contract
        setApprovalForAll(contractAddress, true);
    
    // return the item id for the front-end
        return newItemId;
    }
    
}