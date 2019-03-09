pragma solidity ^0.4.17;
import "myToken.sol";
contract DappTokenSale{
    address admin;
    myToken public tokenContract;
    uint256 tokenPrice;
    function DappTokenSale(myToken _tokenContract,uint256 _tokenPrice)public{
        admin=msg.sender; //initialize admin
        tokenContract = _tokenContract; //assign tokenContract
        tokenPrice=_tokenPrice;//initialize tokenPrize
    }
    function buyTokens(uint _noOfTokens) public payable {
        //require that the amount that we are buying for is equal to tokenprice
        //require that there are enough tokens in the contract
        //require that the transfer is succesaful
        //keep track of no of tokens sold
        //trigger sell event
        
    }
}
