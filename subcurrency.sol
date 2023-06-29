// SPDX-License-Identifier: GPL-3.0

// import type h krna padhta  h
pragma solidity >=0.7.0 <0.9.0;


contract Coin{

    address public minter;
    mapping(address => uint) public balances;

    event sent(address from, address to, uint amount);


    // contructor only runs when we deploy contract
    // owner who deployed the contract
    constructor() {
        minter = msg.sender;
    }

    // make new coin and send them to an address
    // only the owner can send these coins
    function mint(address receiver , uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount; 
    }

    // send any amount of coins
    // to an existing address

    error insufficient(uint requested , uint available);

    function send(address receiver, uint amount) public {
        if(amount > balances[msg.sender])
        revert insufficient({
            requested: amount,
            available: balances[msg.sender]
        });
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit sent(msg.sender, receiver, amount);
    }


}