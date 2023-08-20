
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Token {
    // Public variables here
    string public tokenName = "RACING";
    string public abbrv = "RCR";
    uint public totalSupply = 0;
    address public owner;

    // Mapping variable here
    mapping(address => uint) public balances;

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    // Mint function (only owner can use)
    function mint(address _address, uint _value) public onlyOwner {
        totalSupply += _value;
        balances[_address] += _value;
    }

    // Burn function
    function burn(address _address, uint _value) public {
        require(balances[_address] >= _value, "Insufficient balance");
        totalSupply -= _value;
        balances[_address] -= _value;
    }

    // Transfer function
    function transfer(address _to, uint _value) public {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
    }
}
