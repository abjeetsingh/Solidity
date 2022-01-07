// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.0;

import "./simpleStorage.sol"; 

contract StorageFactory is simpleStorage{

    simpleStorage[] public simpleStorageArray;
    
    function makeSimpleStorage() public{
        simpleStorage simplestorage = new simpleStorage();
        simpleStorageArray.push(simplestorage);
    }
    function SimpleFacrtoryStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public{
        simpleStorage simplestorage = simpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        simplestorage.enterNumber(_simpleStorageNumber);
    }

    function SFGet(uint256 _simpleStorageIndex) view public returns(uint256){
        simpleStorage simplestorage = simpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        return simplestorage.retriveNumber();
    }
}