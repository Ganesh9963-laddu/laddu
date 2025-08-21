pragma solidity ^0.8.0;

contract PauseContract {
    address public owner;
    bool public paused;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier whenNotPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    function togglePause() public onlyOwner {
        paused = !paused;
    }

    function destroy() public onlyOwner {
        selfdestruct(payable(owner));
    }

    function performAction() public whenNotPaused {
        // some logic
    }
}
