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

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //in oder to interact w a contract u gonna need two things 
        // 1- address of contract
        // 2- ABI of contract - application binary interface
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrieve();
    }

}

//import "./SimpleStorage.sol"; exactly the same as copy n pasting simplestorage contract.\
// it gets its github file
