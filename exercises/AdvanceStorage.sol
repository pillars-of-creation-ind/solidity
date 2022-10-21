// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract AdvanceStorage {
    uint[] public ids;


    function add(uint position) public {
        ids.push(position);
    }

    function get(uint position) view public returns(uint){
        return ids[position];
    }

    function getAll() view public returns(uint[] memory){
        return ids;
    }

    function length() view public returns(uint){
        return ids.length;
    }
}
