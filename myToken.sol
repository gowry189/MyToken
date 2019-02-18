contract myToken{
    uint256 totalSupply;
    
    string public name = "Dapp myToken";
    string public symbol = "DmT";
    string public standard = "Dapp myToken v1";
    
    mapping(address => uint256) public balanceOf;
    function myToken(uint _initialSupply) public{
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }
    
    event Transfer(address fromAddress, address toAddress, uint256 amount);
    //function transfer
        //exception if account doesn't have enough
        //return boolean
    //transfer event

    function transfer (address _toAddress, uint256 _value) public returns(bool success){
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_toAddress] += _value;
        Transfer(msg.sender, _toAddress, _value);
        return true;
    } 
}
