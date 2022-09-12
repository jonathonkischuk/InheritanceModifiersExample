// SPDX-License-Identifier: UNLICENSED

// name the version that we intend to use
pragma solidity ^0.8.4;

// import the owner requirement from our 'Ownable.sol' file
import "./Ownable.sol";

// create a new contract
contract Token is Owned {

// set up map/variable/constructor function
    mapping(address => uint) public tokenBalance;

    uint tokenPrice = 1 ether;

    constructor() {
        tokenBalance[owner] = 100;
    }

// create functions to create and burn tokens that are only callable by the owner
    function createNewToken() public onlyOwner {
        tokenBalance[owner]++;
    }

    function burnToken() public onlyOwner {
        tokenBalance[owner]--;
    }

// allows a user to purchase tokens, ultimately sending an equal ammount in ether to the tokenBalance
    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough tokens");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

// allows one user to send a specified amount of tokens to another specified user, assuming they have enough tokens to complete the transaction
    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }

}
