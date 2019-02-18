contract myToken{
    uint256 totalSupply;
    mapping(address => uint256) public balanceOf;
    function myToken(uint _initialSupply) public{
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }
} 
