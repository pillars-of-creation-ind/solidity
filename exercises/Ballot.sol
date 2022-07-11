// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Ballot {
  struct Voter {
    uint weight;
    bool voted;
    uint8 vote;
  }

  struct Proposal {
    uint voteCount;
  }

  address chairperson;
  mapping(address => Voter) voters;
  Proposal[] proposals;

  //Create a new ballot with different proposals
  function ballot(uint _numProposals) public {
    chairperson = msg.sender;
    voters[chairperson].weight = 2;
    //proposals.length = _numProposals;
  }
}