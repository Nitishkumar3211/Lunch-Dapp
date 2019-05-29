pragma solidity ^0.5.1;


contract Lunch {
    
 address public organizer;
 mapping(address => bool) public attendeeJoined;
 uint256 public numOfAttendee;
 uint256 public limit;
 uint256 public totalCost;
 
 
 constructor() public {
    organizer = msg.sender;
    limit = 10;
    numOfAttendee = 0;
    totalCost = 100;
}

function changeTotalCost(uint newTotalCost) public {
    if (msg.sender != organizer) { return; }
    totalCost = newTotalCost;
}

function attend() public payable returns (bool) {
    if (numOfAttendee >= limit) { return false; }
    attendeeJoined[msg.sender] = true;
    numOfAttendee++;
    return true;
}

function getAvailable() public view returns (uint) {
    return limit - numOfAttendee;
}

function checkAttendance(address people) public view returns (bool) {
    return attendeeJoined[people];
}

function splitCost() public view returns (uint) {
    return totalCost / numOfAttendee;
}

    
}