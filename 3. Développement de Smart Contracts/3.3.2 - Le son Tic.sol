pragma solidity ^0.5.7;
contract Pulsation {

    uint public battement;
    string private message;

    constructor(string memory _mess) public{
        message = _mess;
    }

    function ajouterBattement() public returns (string memory) {
        battement++;

        return message;
    }
}