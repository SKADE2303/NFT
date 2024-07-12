// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MoodNFT} from "../src/MoodNFT.sol";
import {DeployMoodNFT} from "../script/DeployMoodNFT.s.sol";

contract DeployMoodNFTTest is Test {
    DeployMoodNFT public deployer;

    function setUp() public {
        deployer = new DeployMoodNFT();

    }

    function testConvertSvgToUri() public{
        
    }
}
