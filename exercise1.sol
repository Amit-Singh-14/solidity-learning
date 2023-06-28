// SPDX-License-Identifier: GPL-3.0

// import type h krna padhta  h
pragma solidity >=0.7.0 <0.9.0;

// create a contact that can store data and return the data back


contract simpleStorage{

    uint storeData;
    string name = "xyz";
    bool swithcOn = true;

    //creating function public to access the afunction outside the contact

    function set(uint x) public{
        storeData = x;
    }

//returns specify krna padha h 
    function get() public view returns(uint) {
        return storeData;
    }
}