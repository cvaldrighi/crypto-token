//defines our compiler version for solidity
pragma solidity ^0.8.4;

contract CryptoToken {

    address public minter;
    mapping(address => uint) public balances;
    event Sent(address from, address to, uint amount);
    
    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
