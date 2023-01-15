// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


contract MerkleProofRegistry {

    uint256 public latestProofBlock;
    mapping(uint256 => bytes32) private _merkleProof;


    address public proofCommiter;

    event MerkleProofCommited(
        uint256 blockNumber,
        address commiter,
        bytes32 merkleProof
    );

    modifier onlyCommiter() {
        require(msg.sender == proofCommiter, "ERR: UNAUTHORIZED PROOF COMMIT");
        _;
    }

    constructor(address _proofCommiter) {
        proofCommiter = _proofCommiter;
    }

    function commitProof(uint256 _blockNumber, bytes32 _proof) public onlyCommiter{
        require(_blockNumber > latestProofBlock, "ERR: BLOCK PROOF ALREADY COMMITED");
        _merkleProof[_blockNumber] = _proof;
        emit MerkleProofCommited(_blockNumber, msg.sender, _proof);
    }

    function getProof(uint256 _blockNumber) public view returns(bytes32) {
        return _merkleProof[_blockNumber];
    }

    function verifyWithProof(bytes32 _hash, uint256 _blockNUmber) public view returns(bool){}
}