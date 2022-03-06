## Solidity Basics

Create a contract that can store data and return the data back, be able to do the following

1. recieve information
2. store information
3. return the information back

Steps:

- It's statically typed
- Comments starts with two forward slashes
  `// Some Comments in solidity`
- [Pragma]
  - First line of solidity file is the pragma statement. It indicates the solidity version that is being used, helps to ensure compatibility in files
    `pragma solidity ^0.8.2;`
- [SmartContract]

  - A contract in the sense of solidity is a collection of code (its functions) and data (its state) that resides ar a specific address on the etherem blockchain.
  - Happens when we deploy smart contract

  ```
  contract [name_of_contract] {
    uint storeData;
    string names;
    bool switchON;
  }
  ```

  - Creates object for us with some name `name_of_contract`. write functions and state inside the contract.
  - Create a variable of `storeData` and it's data type `uint` as integer

- [Variables]: Variables are reserved memory location to store value.
  - Data types can be of character, integer, boolean, floating point, double floating point, boolean
  - `unit storeData = '5'` it returns a integer data type. Here it is 5
  - `string names = 'john'` it returns a string data type. Here it is john
  - `bool switchON = false` it returns a boolean data type. Here it is false
- [Functions]

  - A function is a group of reusable code that can be used anywhere in the application.
  - They perform a specific operation/task
  - The most common way to define a function in solidity is by using the functions keyword,
    followed by unique function name, a list of parameters.
  - set function `public`, it enables visibility so that we can call this outside of the contract,
    `private`, it we didn't want to accessbility outside the function
  - retrieve function return value of storeData, to make it visibility use `public` keyword
    and `view`:
    - it is a global modifiers which tells us function that it can't
      modify the state. helps us to clear off warnings,
      otherwise we are going to be returning something for the data.
    - Also we want to ensure that it's not going to be modified the
      state of the contract
    - `returns`: It is different than return storeData. It is related with function itself
      `returns (uint)`: return for the contracts an integer

  ```
  function storeFun(unit x) public{
    storeData = x;
  }

  function getStoreFun() public view returns (uint) {
    return storeData;
  }
  ```

  [public]: visibility

  [view]: does not modify the state
  [returns]: it does return for the contracts an integer
