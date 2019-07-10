pragma solidity ^0.5.7;
contract Cogere{
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

contract CagnotteFestival is Cogere {
    uint private depensesTotales;
    string[] sponsors;
    uint placesRestantes = 500;
    mapping (address => bool) festivaliers;

    function comptabiliserDepense(uint _montant) private {
      depensesTotales += _montant;
    }    

    function acheterTicket() public payable {
        require(msg.value>= 500 finney,"Place à 0.5 Ethers");
        require(placesRestantes>0,"Plus de places !");
        festivaliers[msg.sender]=true;
        placesRestantes--;
      }
    
    
    function payer(address payable _destinataire, uint _montant) public {
        require(estOrga(msg.sender));
        require(_destinataire != address(0));
        require(_montant > 0);
        _destinataire.transfer(_montant);
      }

    function sponsoriser(string memory _nom) public payable {
        require(msg.value >= 30 ether);
        sponsors.push(_nom);
    }

    function lastSponsor() public view returns (string memory) {
      return sponsors[sponsors.length-1];
    }
}