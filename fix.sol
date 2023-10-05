// This is an improved version of the smart contract with gas efficiency in mind.

pragma solidity ^0.8.0;

contract GasEfficientContract {
    uint256 public num;

    // Function to add two numbers without gas check
    function add(uint256 a, uint256 b) public {
        num = a + b;
    }

    // Function to perform a gas-efficient increment
    function incrementNum(uint256 value) public {
        num = num + value;
    }
}
