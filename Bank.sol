pragma solidity ^0.8.6;
import " ./Ownable.sol";

contract Bank is  Ownable {

    mapping(address => uint)balance;

   
    function deposit() public payable returns (uint){

        balance[msg.sender] +=msg.value;
        emit balanceAdded(msg.value,msg.sender);
        return balance[msg.sender];
    }
    function withdraw(uint amount)public onlyOwner returns(uint){
       
       require(balance[msg.sender] >= amount);
       msg.sender.transfer(amount);
       balance[msg.sender]-= amount;
       return balance[msg.sender];

    }
    function tatalBalance()public view return(uint){
        return address(this).balance;
    }
}