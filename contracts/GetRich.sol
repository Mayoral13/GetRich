pragma solidity ^0.8.11;
contract GetRich{

    mapping(address => uint)Deposits;
    mapping(address => uint)balance;

    constructor()payable{
   }

    function Fund()public payable returns(bool success){
    require(msg.value == 0.1 ether,"Send exactly 0.1 ETH");
    Deposits[msg.sender] += msg.value;
    balance[msg.sender] = (Deposits[msg.sender] + (Deposits[msg.sender]/2));
    balance[msg.sender] = 0;
    Deposits[msg.sender] = 0;
    (success) = payable(msg.sender).send(balance[msg.sender]);
    require(success);
   }


   }