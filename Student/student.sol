pragma solidity ^0.5.0;

contract Student{
    struct details{
        string name;
        uint age;
    }
    mapping(uint => details) public studentDetails;
    //if public is added to the variable it will automatically give a get function
    //memory- to define that the data is temporary. it also removes gas cost
    function setStudent(uint _admissionNo, string memory _name, uint _age) public {
        studentDetails[_admissionNo] = details(_name, _age);
        }
} 
