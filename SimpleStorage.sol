// SPDX-License-Identifier: MIT;
// simple declaration
// array
// struct
//  array of struct
//  mapping of array
// Functions

pragma solidity ^0.6.0;

contract simpleStorage{

// making a variable
    uint256 favoriteNumber ;
// writting a function to input value for faviruteNumber
    function enterNumber(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }
// Returning a function
    function retriveNumber() view public returns(uint256){
        return favoriteNumber;
    }

// Struct

    struct Person{
        uint desiredNumber;
        string name;
    }
// adding element in struct
    Person internal person = Person(12, "Abjeet") ;
// making array of struct

    Person[] public people;

// function to add element in people(array)
    // function addPeople(uint256 _desiredNumber, string memory _name) public{
    //     people.push(Person(_desiredNumber,_name));
    // }
// Making a mapping of struct

    mapping ( uint256 => string)  toMapName;

    function addPeople(uint256 _desiredNumber, string memory _name) public{
        people.push(Person(_desiredNumber,_name));
        toMapName[_desiredNumber] = _name;
    }

    function getName(uint256 _desiredNumber) view public returns(string memory){
        return toMapName[_desiredNumber];
    }

}