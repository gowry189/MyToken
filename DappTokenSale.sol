pragma solidity ^0.4.17;
import "myToken.sol";
contract DappTokenSale{
    address admin;
    myToken public tokenContract;
    function DappTokenSale(myToken _tokenContract)public{
        admin=msg.sender; //initialize admin
        tokenContract = _tokenContract; //assign tokenContract
        //initialize tokenPrize
    }
}
