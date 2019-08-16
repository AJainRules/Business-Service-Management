pragma solidity ^0.4.25;

contract File{
    
    struct FileInfo{
        string name;
        string description;
        uint price;
    }
    
    address public seller; //owner of the contract
    
    mapping(address => FileInfo) public fileinfos;
    //Fileinfo[] public savingmap;
    
    constructor() public{
        seller = msg.sender;
        }
        
    modifier onlySeller(){
        require(msg.sender == seller,
    "Only seller can set these parameteres."
    );
    _;
        
    }
    
    event files(string name,string description,uint price);
    
    function setFileInfo(address _seller, string name, string description, uint price) onlySeller public{
        fileinfos[_seller] = FileInfo(name, description, price);
        emit files(name, description, price);
    }
    
    function getFileInfo(address _seller) view public returns (string, string, uint) {
        return (fileinfos[_seller].name, fileinfos[_seller].description, fileinfos[_seller].price);
        
    }
    
    
}