pragma solidity ^0.8.0;

contract VariableDemo {
    uint public number = 10;
    string private name = "Blockchain";
    bool internal status;

    function getName() public view returns(string memory) {
        return name;
    }
}
