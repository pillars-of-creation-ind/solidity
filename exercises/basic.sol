// SPDX-License-Identifier: MIT
//this is comment

pragma solidity >=0.7.0 <0.9.0;

// Create a contract

contract abhishekContract {
    uint256 storeData;

    function setStore(uint256 value) public {
        storeData = value;
    }

    function getStore() public view returns (uint256) {
        return storeData;
    }
}
