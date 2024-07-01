// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployScript} from "../script/DeployBasicNFT.s.sol";

contract CounterTest is Test {
    DeployScript public BasicNFT_deployer;
    BasicNFT public basicNFT;

    function setUp() public {
        BasicNFT_deployer = new DeployScript();
        basicNFT = BasicNFT_deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "DOGIE";
        string memory actualName = basicNFT.name();

        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }
}
