// This is a vulnerable smart contract that demonstrates a Gas Limit Vulnerability.

pragma solidity ^0.8.0;

contract GasLimitVulnerableContract {
    uint256 public num;

    // Function to add two numbers
    function add(uint256 a, uint256 b) public {
        require(gasleft() > 100000, "Not enough gas left.");

        num = a + b;
    }

    // Function to perform a busy loop consuming gas
    function consumeGas() public {
        uint256 i = 0;
        while (i < 10000) {
            num = num + 1;
            i = i + 1;
        }
    }
}
