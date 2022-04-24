pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    // Mappings
    // A mapping is essentially a key-value store for storing and looking up data.
    // Using two mappings: one that keeps track of the address that owns a zombie, and another that keeps track of how many zombies an owner has.
    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;

    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        // msg.sender
        zombieToOwner[id] = msg.sender; 
        ownerZombieCount[msg.sender]++; // Increase the counter ++
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        // Using require makes it so that the function will throw an error and stop executing if some condition is not true.
        require(ownerZombieCount[msg.sender] == 0); // Conditioning the function to only run when the owner has 0 Zombies.
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}

// Inheritance

contract ZombieFeeding is ZombieFactory {
    
}
