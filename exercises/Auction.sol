// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Auction {
    // Structure of Item consists of id and tokens bid in favour of particular item
    struct Item {
        uint itemId;
        uint[] itemTokens;
    }

    //Structure to hold the details of a persons who will auction
    struct Person {
        uint remainingTokens; // tokens remaining with bidder
        uint personId; // it serves as tokenId as well
        address addr;//address of the bidder
    }

    mapping(address => Person) tokenDetails; //address to person 
    Person [4] bidders;//Array containing 4 person objects
    
    Item [3] public items;//Array containing 3 item objects
    address[3] public winners;//Array for address of winners
    address public beneficiary;//owner of the smart contract
    
    uint bidderCount=0;//counter

    //constructor
    constructor() payable{
        //Part 1 Task 1 -- Initialize beneficiary with address of smart contract’s owner
        beneficiary = msg.sender;

        uint[] memory emptyArray;
        items[0] = Item({itemId:0,itemTokens:emptyArray});

        //Part 1 Task 2 -- Initialize two items with at index 1 and 2.
        items[1] = Item({itemId:1, itemTokens:emptyArray});
        items[2] = Item({itemId:2, itemTokens:emptyArray});
    }

    function register() public payable{
        bidders[bidderCount].personId = bidderCount;
        //Part 1 Task 3 -- Initialize the address of the bidder 
        bidders[bidderCount].addr = msg.sender;
        bidders[bidderCount].remainingTokens = 5; // only 5 tokens
        
        tokenDetails[msg.sender]=bidders[bidderCount];
        bidderCount++;
    }

    function bid(uint _itemId, uint _count) public payable{
         /*
            Bids tokens to a particular item.
            Arguments:
            _itemId -- uint, id of the item
            _count -- uint, count of tokens to bid for the item
        */
        /*
        Part 1 Task 4 -- Implement the three conditions below.
            4.1 If the number of tokens remaining with the bidder is < count of tokens bidded, revert.
            4.2 If there are no tokens remaining with the bidder, revert.
            4.3 If the id of the item for which bid is placed, is greater than 2, revert.
        */
        if (tokenDetails[msg.sender].remainingTokens < _count ) { 
            revert();
        }
        
        if (tokenDetails[msg.sender].remainingTokens == 0 ) { 
            revert();
        }
        
        if (_itemId > 2 ) { 
            revert();
        }

        /*Part 1 Task 5 -- Decrement the remainingTokens by the number of tokens bid and store the value in balance variable.*/
        uint balance= tokenDetails[msg.sender].remainingTokens - _count;
        tokenDetails[msg.sender].remainingTokens=balance;
        bidders[tokenDetails[msg.sender].personId].remainingTokens=balance;
        //updating the same balance in bidders map.
        Item storage bidItem = items[_itemId];
        for(uint i=0; i<_count;i++) {
            bidItem.itemTokens.push(tokenDetails[msg.sender].personId);    
        }
    }

    // Part 2 Task 1 -- Create a modifier named "onlyOwner" to ensure that only owner is allowed to reveal winners
    modifier onlyOwner {
        require( beneficiary == msg.sender);
        _;
    }

    function revealWinners() public onlyOwner{
        /* Iterate over all the items present in the auction.
            If at least on person has placed a bid, randomly select          the winner 
        */
        for (uint id = 0; id < 3; id++) {
            Item storage currentItem=items[id];

            if(currentItem.itemTokens.length != 0){
                // generate random# from block number 
                uint randomIndex = (block.number / currentItem.itemTokens.length)% currentItem.itemTokens.length; 
                // Obtain the winning tokenId

                uint winnerId = currentItem.itemTokens[randomIndex];
                    
                /* Part 1 Task 6 -- Assign the winners*/
                winners[id] = bidders[winnerId].addr;                
            }
        }
    }

    //Below methods are used to assist Grading. 
    function getPersonDetails(uint id) public view returns(uint,uint,address){
        return (
            bidders[id].remainingTokens,bidders[id].personId,bidders[id].addr
        );
    }

}