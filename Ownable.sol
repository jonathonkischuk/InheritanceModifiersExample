// SPDX-License-Identifier: UNLICENSED

// set the version that we are working with
pragma solidity ^0.8.4;

// create a new contract that is a external solidity contract that we can access in other contracts                                                                                                                                                                                                                                                                                                                         
contract Owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not allowed");
        _;
    }
}
