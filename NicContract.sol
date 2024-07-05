// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

contract MetaHouseContract {
    address public landOwner;
    bool public inHouse;

    constructor() {
        landOwner = msg.sender;
        inHouse = false;
    }

    modifier isLandOwner {
        require(msg.sender == landOwner, "Only the land owner can access.");
        _;
    }

    function enterNicHouse() public isLandOwner {
        inHouse = true;
    }

    function leaveNicHouse() public isLandOwner {
        inHouse = false;
    }

    function peepHouse() public view {
        if(inHouse == false){
            revert("Land owner is not in MetaHouse.");
        } 
        else {
            revert("Land owner is in MetaHouse.");
        }
    }

    function checkHouse() public view {
        assert(msg.sender == landOwner);
    }
}