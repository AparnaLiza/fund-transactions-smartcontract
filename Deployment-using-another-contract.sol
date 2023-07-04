//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage(); // created a memory
        simpleStorageArray.push(simpleStorage); // made an array of simplestorage contract deployment
        //simpleStorageArray is the new lit of all the simplestorage contracts deployed
        //every new item in list (array file) that is SimpleStorage is put in place by .push
    }

}

//import "./SimpleStorage.sol"; exactly the same as copy n pasting simplestorage contract.\
// it gets its github file
