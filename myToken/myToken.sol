pragma solidity ^0.4.18;

contract myToken{
    uint256 totalSupply;
    
    string public name = "Dapp myToken";
    string public symbol = "DmT";
    string public standard = "Dapp myToken v1";
    
    mapping(address => uint256) public balanceOf;
    mapping(address=>mapping(address=>uint256)) public allowance;
    
   function myToken(uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }
    
    event Transfer(address fromAddress, address toAddress, uint256 amount);
    //transfer event
    //function transfer
        //exception if account doesn't have enough
        //return boolean

    function transfer (address _toAddress, uint256 _value) public returns(bool success){
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_toAddress] += _value;
        Transfer(msg.sender, _toAddress, _value);
        return true;
    }
    
    event Approval(address indexOwner, address indexedSpender, uint256 amount);   
     //approval event
    //delegated transfer
        //function approve 
            // _ spender = the one sending on the other persons behalf
        //function transferFrom to handle delegated transfer
    
    function approval (address _spender, uint256 _value) public returns (bool success){
        allowance[msg.sender][_spender]=_value;
        Approval(msg.sender,_spender,_value);
        return true;
        }
    
    function transferFrom(address fromAddress, address toAddress, uint256 _value) public returns(bool success){
        require (_value <= balanceOf[fromAddress]);
        require(_value <= allowance[fromAddress][msg.sender]);
        balanceOf[fromAddress] -= _value;
        balanceOf[toAddress] += _value;
        allowance[fromAddress][msg.sender] -= _value;
        Transfer(fromAddress,toAddress,_value);
        return true;
        
    }
}
