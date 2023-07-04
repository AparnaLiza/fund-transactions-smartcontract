// withdraw the fund, to send ether/native curreny there are three ways 
        //transfer 1, send, call
        //msg.sender = address
        //payable(msg.sender = payable address (a type). in solidity to send native currency we can only work with this type
        //transfer
        payable(msg.sender).transfer(address(this).balance);//this- whole contract above. .balance - whole currency amount
        //send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send failed");
        //call
        (bool callSuccess, ) payable(msg.sender).call{value: address(this).balance}("");
        require(sendSuccess, "Send failed");
