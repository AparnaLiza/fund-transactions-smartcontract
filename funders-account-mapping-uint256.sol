// contract targets -
//get funds from users
// withdraw funds
//set a minimum funding value in usd

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 50 * 1e18; // 1*10 ** 18

    address[] public funders; // just created a simple public list by using [] by the name address
    // data structures for an aray
    mapping(address => uint256) public addressToAmountFunded;


    function fund() public payable{
        //want to be able to set a minimum fund amount in usd 
        // 1. how do we send eth to this contract? 
        // msg.value is global keyword used to show how much eth or native currency is sent
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enough!"); //1e18 = 1*10 **18 == 1000000000000000000 (wei in eth)
        funders.push(msg.sender); // this adds address of anyone who goes 
        //and calls the above mentioned line of code for sending funds
        //msg.sender is also a global keyword shows whoever calls the fund function
        addressToAmountFunded[msg.sender] = msg.value; 
    }

    function getPrice() public view returns(uint256) {
        // we r interested in int price of chainlink. 
        // the above code is the way were interacting with sysrems outside of our contract
        // for hat we need abi n address of the conntract 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 price,,,) = priceFeed.latestRoundData(); 
        // prics of eth in terms of usd
        return uint256(price * 1e10); 
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    //function withdraw(){}
}

// revert- undo any action before, and send remaining gas back
