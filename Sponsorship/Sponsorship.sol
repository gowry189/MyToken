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
    when he call this function.*/ 
    function addSponsor()public payable{
        require(workshopCost==msg.value);
        sponsorsContribution[msg.sender]++;
        sponsorsList.push(msg.sender);
    }
    function getSponsorsContribution(address _sponsor)public view returns(uint c){
        c=sponsorsContribution[_sponsor];
        return c;
    }
    function getSponsorsContributionPercent(address _sponsor) public view returns(uint p){
        uint256 totalContributions=0;
        p=0;
        for(uint256 i=0; i<sponsorsList.length;i++){
            totalContributions=sponsorsContribution[sponsorsList[i]];
        }
        if(totalContributions==0){
            return p;
        }
        p=100*(sponsorsContribution[_sponsor]/totalContributions);
        return p;
    }
    /*function to transfer required amount from contract account 
    to the owner address*/
    function getEther(uint256 _amt_to_be_withdrawn) public{
     require(msg.sender == owner);
     require(address(this).balance >= _amt_to_be_withdrawn);
     msg.sender.transfer(_amt_to_be_withdrawn);
    }
}
