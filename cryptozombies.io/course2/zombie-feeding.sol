pragma solidity >=0.5.0 <0.6.0;

import "./zombie-factory.sol";

// Inheritance
contract ZombieFeeding is ZombieFactory {
// Variables declared outside of functions) are by default storage and written permanently to the blockchain. 
// While variables declared inside functions are memory and will disappear when the function call ends.

function feedAndMultiply(uint _zombieId, uint _targetDna) public {
    require(msg.sender == zombieToOwner[_zombieId]); // Verify that msg.sender is equal to this zombie's owner
    Zombie storage myZombie = zombies[_zombieId];
  }

}

