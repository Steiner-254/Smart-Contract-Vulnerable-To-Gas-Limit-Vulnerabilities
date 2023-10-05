# Smart-Contract-Vulnerable-To-Gas-Limit-Vulnerabilities
Smart Contract Vulnerable To Gas Limit Vulnerabilities

# Description
~ A Gas Limit Vulnerability is a situation in which a smart contract's execution consumes more gas (computational resources) than the block's gas limit allows, resulting in the contract failing to execute or causing unexpected behavior. This vulnerability often arises due to poor contract design, infinite loops, or excessive computational complexity.

# vulnerable.sol
~ In this contract:

1. The add function takes two numbers as input and attempts to add them. However, it includes a require statement to check if there's enough gas left. If there's not enough gas left (e.g., if the gas limit is too low), the contract will revert, and the addition won't take place.

2. The consumeGas function contains a loop that consumes a significant amount of gas by repeatedly adding 1 to the num variable. If this loop is called with insufficient gas, it could lead to a Gas Limit Vulnerability. If a transaction tries to execute consumeGas with a gas limit that's too low to complete the loop, it will fail, and any state changes made before the failure will be reverted.

# fix.sol
~ In this modified contract:

1. The add function no longer includes the gas check using require. This change allows the function to execute without worrying about gas limits. It's generally a better practice to leave gas management to the Ethereum network rather than attempting to check it explicitly.

2. The consumeGas function with a busy loop has been removed, as it is not a good practice to have gas-consuming loops in smart contracts. Gas costs should be predictable and manageable.

3. I added a new function incrementNum, which allows you to increment the num variable by a specified value in a gas-efficient manner. This function doesn't include any loops and is suitable for increasing the value of num without risking gas limit issues.

~ By simplifying the contract and removing unnecessary gas checks and gas-consuming operations, you reduce the likelihood of encountering Gas Limit Vulnerabilities while keeping your contract efficient and reliable.
