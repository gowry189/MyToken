contract myToken{
    uint256 totalSupply;
    
    string public name = "Dapp myToken";
    string public symbol = "Dapp";
    string public standard = "Dapp myToken v1";
    
    mapping(address => uint256) public balanceOf;
    function myToken(uint _initialSupply) public{
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }
}
