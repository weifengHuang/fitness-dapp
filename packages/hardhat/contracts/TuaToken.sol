// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TuaToken is ERC20, Ownable {
    uint256 public constant INITIAL_SUPPLY = 1000000 * 10**18; // 1 million tokens
    uint256 public constant TOKENS_PER_WORKOUT = 10 * 10**18; // 10 tokens per workout

    mapping(address => uint256) public lastWorkoutTimestamp;

    constructor() ERC20("Tua Fitness Token", "TUA") {
        _mint(msg.sender, INITIAL_SUPPLY);
        
    }

    function mintForWorkout() external {
        require(block.timestamp >= lastWorkoutTimestamp[msg.sender] + 1 days, "You can only earn tokens once per day");
        
        lastWorkoutTimestamp[msg.sender] = block.timestamp;
        _mint(msg.sender, TOKENS_PER_WORKOUT);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Function to allow owner to mint additional tokens if needed
    function mintAdditional(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}