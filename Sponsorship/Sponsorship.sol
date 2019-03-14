 
pragma solidity ^0.4.17;
contract Sponsorship{
    uint256 public workshopCost;
    mapping (address => uint256)public sponsorsContribution;
    address []sponsorsList;
    address owner;
    function Sponsorship(uint256 _workshopCost)public{
        workshopCost = _workshopCost;
        owner = msg.sender;
    }
    /*sponsor a new workshop by sending ether from his wallet 
    when he call the function.*/ 
}
