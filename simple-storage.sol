// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {

    uint256 public favoriteNumber;

    

    mapping(string => uint256) public nameToFavoriteNumber;

       struct People {
        uint256 favoriteNumber;
        string name;
    }
    
    //uint256[] public favoriteNumbersList;
    People[] public people;

    function store(uint256 _favoriteNumber) public { 
        favoriteNumber = _favoriteNumber; 
    } // view, pure
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
     // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }


}

//in close brackets is the input type
// every smart contract has its own address like the wallet's
// uint -favorite is the input number of 256 bytes by the user inside the variable favoriteNumber
// store is a name of function
//() means no parameters assigned
// view and pure keywords in functions dont need gas to run
//pure could be used to implement an alogorithm that dont see or interact with any storage/contract
// struct people is same as the function of uint256 
// in an array/ list, program demands input of the index locating to that one object in the list
//function addPerson(string memory _name, uint256 _favoriteNumber) public {
        //people.push(People(_favoriteNumber, _name));
       // nameToFavoriteNumber[_name] = _favoriteNumber; all these are person function
       // evm is used by avalanche, fantom, polygon
