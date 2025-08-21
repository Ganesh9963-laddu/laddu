pragma solidity ^0.8.0;

contract FunctionTypes {
    uint public x = 100;

    function getX() public view returns (uint) {
        return x;
    }

    function calculate(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    receive() external payable {}

    fallback() external payable {}
}
