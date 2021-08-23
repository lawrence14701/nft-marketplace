// SPDX-Liscense-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";



/* 
This is a pretty straightforward NFT smart contract that allows users to mint unique digital assets and have ownership of them.
In this contract we are inheriting from the ERC721 standard implemented by OpenZepplin
*/
contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress; // marketplace address



    constructor(address marketplaceAddress) ERC721("Metaverse Tokens", "METT") {
        contractAddress = marketplaceAddress;
    }

    function createToken(string memory tokenURI) public returns (uint) {
      _tokenIds.increment();
      uint256 newItemId = _tokenIds.current();

      _mint(msg.sender, newItemId);
      _setTokenURI(newItemId, tokenURI);
      setApprovalForAll(contractAddress, true);
      return newItemId;
    }

}