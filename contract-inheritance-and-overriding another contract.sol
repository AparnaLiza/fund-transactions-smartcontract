//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {

    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }

}

// we can have extrastorage inherit all the functionality of simplestorage by 
// for adding 5 to the fav number we can overriding the functions
// the keyword we'll use - virtual, override
// in order to be a function to be overridable, we need to add 'virtual'keyword to the store
//function in the 1. simplestorage store function
