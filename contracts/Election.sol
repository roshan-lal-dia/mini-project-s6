//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Election {

    address public manager;

    struct Candidate {
        uint id;
        string CfirstName;
        string ClastName;
        string CidNumber;
        uint voteCount;
    }

    mapping (address => bool) public voters;

    mapping (uint => Candidate) public candidates;

    uint public candidatesCount;

    event votedEvent (
        uint indexed candidateId
    );


    constructor () {
        manager = msg.sender;
    }

    function addCandidate (string memory _CfirstName, string memory _ClastName, string memory _CidNumber) public restricted {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _CfirstName, _ClastName, _CidNumber, 0);
    }

    modifier restricted () {
        require(msg.sender == manager, "Access denied. Only manager can perform this action.");
        _;
    }


    function vote (uint _candidateId) public {
        require(!voters[msg.sender], "You have already voted.");

        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");

        voters[msg.sender] = true;

        candidates[_candidateId].voteCount++;

        uint candidateId = _candidateId;

        emit votedEvent(_candidateId);
    }

    // Users
    // Register
    struct User {
        string firstName;
        string lastName;
        string idNumber;
        string email;
        string password;
        address add;
    }

    mapping (uint => User) public users;

    uint public usersCount;

    function addUser (string memory _firstName, string memory _lastName, string memory _idNumber, string memory _email, string memory _password) public {
        usersCount++;
        users[usersCount] = User(_firstName, _lastName, _idNumber, _email, _password, msg.sender);
    }

}
