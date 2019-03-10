pragma solidity ^0.4.17;
import "./myToken.sol";
contract DappTokenSale{
    address admin;
    myToken public tokenContract;
    uint256 tokenPrice;
    uint256 tokenSold;
    event Sell(address _buyer, uint256 _amount);
    function DappTokenSale(myToken _tokenContract,uint256 _tokenPrice)public{
        admin=msg.sender; //initialize admin
        tokenContract = _tokenContract; //assign tokenContract
        tokenPrice=_tokenPrice;//initialize tokenPrize
    }
    function mul(uint x, uint y) internal pure returns(uint z){
        require(y==0 || (z=x*y)/y==x);
    }
    function buyTokens(uint _noOfTokens) public payable {
        //require that the amount that we are buying for is equal to tokenprice
        require(msg.value == mul(_noOfTokens,tokenPrice));
        //require that there are enough tokens in the contract
        require(tokenContract.balanceOf(this) >= _noOfTokens);
        //require that the transfer is successful
        require(tokenContract.transfer(msg.sender,_noOfTokens));
        //keep track of no of tokens sold
        tokenSold += _noOfTokens;
        //trigger sell event
        Sell(msg.sender,_noOfTokens);
    }
    
    function endSale()public{
        require(msg.sender==admin);
        tokenContract.transfer(admin,tokenContract.balanceOf(this));
    }
}
