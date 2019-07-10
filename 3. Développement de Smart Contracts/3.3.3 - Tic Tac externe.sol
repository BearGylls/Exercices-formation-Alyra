pragma solidity ^0.5.8;
contract Pulsation {

    uint public battement;
    string private message;

    constructor(string memory mess) public{
        battement = 0;
        message = mess;
    }   

    function ajouterBattement() public returns (string memory) {
        battement++;
        return message;
    }
}
contract Pendule {

    string[] public balancier;
    Pulsation contratTac;
    Pulsation contratTic;
   
    function ajouterTacTic(Pulsation _tac, Pulsation _tic) public {
        contratTac = _tac;
        contratTic = _tic;
    }
   
    function mouvementsBalancier() public{
        balancier.push(contratTac.ajouterBattement());
        balancier.push(contratTic.ajouterBattement());
    }
   }