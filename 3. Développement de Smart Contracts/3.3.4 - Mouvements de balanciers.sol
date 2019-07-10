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
    
   
    function ajouterTacTic() public returns (string memory _tic, string memory _tac){
        contratTac = new Pulsation("Tac");
        contratTic = new Pulsation("Tic");
        
        return(contratTic.ajouterBattement(),contratTac.ajouterBattement());
    }
   
    function mouvementsBalancier(uint _k) public {
        for(uint i=0;i<_k;i++){
            balancier.push(contratTac.ajouterBattement());
            balancier.push(contratTic.ajouterBattement());
        }
    }
   }