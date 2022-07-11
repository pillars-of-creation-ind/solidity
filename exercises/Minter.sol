// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract coin {
  // public keyword make variable readable from outside
  address public minter;
  mapping(address => uint) public balances;

  //Event allow light client to react on changes efficiently
  event Sent(address from, address to, uint amount);

  //Constructor whose code is run only when the contract is created
  function Coin() public {
    minter = msg.sender;
  }

  function mint(address receiver, uint amount) public {
    if(msg.sender != minter) return;
    balances[receiver] += amount;
  }

  function send(address receiver, uint amount) public {
    if(balances[msg.sender] < amount) return;
    balances[msg.sender] -= amount;
    balances[receiver] += amount;
    emit Sent(msg.sender, receiver, amount);
  }
}
