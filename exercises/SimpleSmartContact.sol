// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SimpleSmartContract {
    string public data;

    function hello() pure public returns(string memory) {
        return "Hello World";
    }


    function set(string memory _data) public {
        data = _data;
    }

    function get() view public returns(string memory){
        return data;
    }
}