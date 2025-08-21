pragma solidity ^0.8.0;

// ---------------------
// Base.sol
// ---------------------
contract Base {
    address public owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid new owner");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}

// ---------------------
// Derived.sol
// ---------------------
contract Derived is Base {
    string public data;

    event DataUpdated(string oldData, string newData);

    function setData(string memory _data) public onlyOwner {
        string memory old = data;
        data = _data;
        emit DataUpdated(old, _data);
    }
}
