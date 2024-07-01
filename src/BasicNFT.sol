// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 internal s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;
    constructor() ERC721("DOGIE", "DOGE") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender(), s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 s_tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToUri[s_tokenId];
    }
}
