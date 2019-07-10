pragma solidity ^0.5.7;
contract CagnotteFestival{

 mapping (address => uint) organisateurs;
 mapping (address => bool) isOrga;

 constructor() public {
   organisateurs[msg.sender] = 100;
   isOrga[msg.sender]=true;
 }

 function transfererOrga(address _orga, uint _parts) public {
    require(isOrga[msg.sender]); 
    organisateurs[msg.sender] -= _parts;
    organisateurs[_orga] += _parts;
    isOrga[_orga]=true;
 }

 function estOrga(address _orga) public view returns (bool){ 
     return isOrga[_orga];
 }
}