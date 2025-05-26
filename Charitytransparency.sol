// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract CharityTransparency {
    address public admin;
    uint public requestCount = 0;

    struct Donation {
        address donor;
        uint amount;
        uint timestamp;
    }

    struct FundRequest {
        uint id;
        address payable charity;
        uint amount;
        string purpose;
        string proofOfUse; // IPFS hash or link to doc/image
        bool approved;
        bool paid;
    }

    Donation[] public donations;
    mapping(uint => FundRequest) public requests;

    event Donated(address indexed donor, uint amount);
    event FundRequested(uint indexed id, address indexed charity, uint amount, string purpose, string proofOfUse);
    event RequestApproved(uint indexed id);
    event FundsReleased(uint indexed id, address indexed charity, uint amount);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this.");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    // Donate to the contract
    function donate() external payable {
        require(msg.value > 0, "Donation must be greater than 0");
        donations.push(Donation(msg.sender, msg.value, block.timestamp));
        emit Donated(msg.sender, msg.value);
    }

    // Charity submits a request for funds
    function requestFunds(uint amount, string calldata purpose, string calldata proofOfUse) external {
        require(amount > 0, "Amount must be positive");

        requestCount++;
        requests[requestCount] = FundRequest({
            id: requestCount,
            charity: payable(msg.sender),
            amount: amount,
            purpose: purpose,
            proofOfUse: proofOfUse,
            approved: false,
            paid: false
        });

        emit FundRequested(requestCount, msg.sender, amount, purpose, proofOfUse);
    }

    // Admin approves a fund request
    function approveRequest(uint requestId) external onlyAdmin {
        FundRequest storage req = requests[requestId];
        require(!req.approved, "Already approved");
        req.approved = true;

        emit RequestApproved(requestId);
    }

    // Charity can withdraw once approved
    function releaseFunds(uint requestId) external {
        FundRequest storage req = requests[requestId];
        require(msg.sender == req.charity, "Not your request");
        require(req.approved, "Request not approved");
        require(!req.paid, "Already paid");
        require(address(this).balance >= req.amount, "Insufficient funds");

        req.paid = true;
        req.charity.transfer(req.amount);

        emit FundsReleased(requestId, req.charity, req.amount);
    }

    // Get all donations
    function getDonations() external view returns (Donation[] memory) {
        return donations;
    }

    // Get contract balance
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
