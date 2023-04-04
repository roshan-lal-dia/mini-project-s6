//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    struct Voter {
        bool registered;
        bool voted;
        uint256 vote;
    }

    mapping(address => Voter) public voters;
    address[] public candidateList;
    mapping(uint256 => uint256) public voteCounts;

    function register() public {
        require(!voters[msg.sender].registered, "You are already registered.");
        voters[msg.sender].registered = true;
    }

    function addCandidate(address candidate) public {
        require(msg.sender == candidate, "Only the candidate can add themselves.");
        candidateList.push(candidate);
    }

    function vote(uint256 candidateIndex) public {
        require(voters[msg.sender].registered, "You must be registered to vote.");
        require(!voters[msg.sender].voted, "You have already voted.");
        require(candidateIndex < candidateList.length, "Invalid candidate index.");
        voters[msg.sender].voted = true;
        voters[msg.sender].vote = candidateIndex;
        voteCounts[candidateIndex]++;
    }

    function getVoteCount(uint256 candidateIndex) public view returns (uint256) {
        require(candidateIndex < candidateList.length, "Invalid candidate index.");
        return voteCounts[candidateIndex];
    }

    function getCandidateList() public view returns (address[] memory) {
        return candidateList;
    }

    function isRegistered() public view returns (bool) {
        return voters[msg.sender].registered;
    }

    function hasVoted() public view returns (bool) {
        return voters[msg.sender].voted;
    }

    function getVote() public view returns (uint256) {
        return voters[msg.sender].vote;
    }
}
