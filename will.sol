// SPDX-License-Identifier: GPL-3.0

// import type h krna padhta  h
pragma solidity >=0.7.0 <0.9.0;

// Will to tranfer owner ether to family after deceased.

contract Will {
    address owner;
    uint fortune;
    bool deceased;

// payable se we allow to send ether 
      constructor() payable public {
        owner = msg.sender; // who is calling this contract  rep address 
        fortune = msg.value; // msg value tells us how much etheris being send
        deceased = false;
    }

    // create modifier so that we only allocate funds if granps deceased 
    modifier mustBeDeceased {
        require( deceased == true);
        _;
    }
    // create modifier so the only owner who can call the contract
     modifier onlyOwner {
        require( msg.sender == owner);
        _;
        
    }

    // list of familyWallets
    address payable [] familyWallets;

    // map thorugh inhertance
    mapping (address => uint) inheritance;


    function setInheritance (address  payable  wallet , uint amount) public onlyOwner{

        familyWallets.push(wallet);
        inheritance[wallet] = amount;

    }

    // pay each member based on their wallet address
    function payout() private  mustBeDeceased {
        for(uint i = 0; i < familyWallets.length; i++){
            //tranfer the ether toh wallet 
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
        }
    }

    function setDeceased() public onlyOwner{
        deceased = true;
        payout();
    }
}
