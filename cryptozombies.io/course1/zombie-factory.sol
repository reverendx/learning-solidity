pragma solidity >=0.5.0 <0.6.0;

// Beginning of contract.
contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna); // Event for every time a new zombie was created, so the app can display it.
    // Unsigned integers and state variables
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    // Structs allow you to create more complicated data types that have multiple properties.
    struct Zombie {
        string name;
        uint dna;       // Properties
    }
    // When you want a collection of something, you can use a (fixed or dynamic) array. An array of structs is possible 
    Zombie[] public zombies; // state variables are stored permanently in the blockchain? So creating a dynamic array of structs like this can be useful for storing structured data in your contract, kind of like a database.
    // there are two ways in which you can pass an argument to a Solidity function: by value and by reference.
    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1; // Create a new zombie and add it to the array.
        emit NewZombie(id, _name, _dna);
    }
    // Generates a random DNA number from a string.
    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str))); // Keccak256 and Typecasting for pseudo-random number generation.
        return rand % dnaModulus;
    }
    // public function that takes an input, the zombie's name, and uses the name to create a zombie with random DNA.
    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}

