// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";

contract MoodNFT is ERC721 {

    uint256 private s_tokenCounter;
    string private s_sadSVGimageURI;
    string private s_happySVGimageURI;

    enum MOOD{
        Happy,
        Sad
    }

    mapping (uint256 => MOOD) private s_tokenIdtoMood;


    constructor(string memory sadSVG,string memory happySVG) ERC721 ("Mood NFT","MN"){
        s_tokenCounter = 0;
        s_sadSVGimageURI = sadSVG;
        s_happySVGimageURI = happySVG;
    }

    function mintNFT() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdtoMood[s_tokenCounter] = MOOD.Happy;
        s_tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {

        string memory imageURI;
        if(s_tokenIdtoMood[tokenId] == MOOD.Happy){
            imageURI = s_happySVGimageURI;
        }
        else{
            imageURI = s_sadSVGimageURI;
        }


       return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes( 
                        abi.encodePacked(
                            '{"name":"',
                            name(), // You can add whatever name here
                            '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
                            '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );

    }




    
}