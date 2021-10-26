// SPDX-License-Identifier: MIT
pragma solidity >0.4.0;
pragma experimental ABIEncoderV2;

contract MultiSigWallet {
    uint minApprovers;   
    
    address beneficiary;
    address owner;
    
    mapping (address => bool) approvedBy;
    mapping (address => bool) isApprover;
    
    uint approvalsNum;
    
    constructor(
        address[] memory _approvers,
        uint _minApprovers,
        address _beneficiary
        ) public payable {
        
        require(_minApprovers <= _approvers.length, "Req number of approvers shousl be less than number of approvers");
        
        minApprovers = _minApprovers;
        beneficiary = _beneficiary;
        owner = msg.sender;
        
        for(uint i =0; i < _approvers.length; i++) {
            address approver = _approvers[i];
            isApprover[approver] = true;
        }
    }
    
    function approve() public {
        require(isApprover[msg.sender], "Not an approver");
        
        if(!approvedBy[msg.sender]){
            approvalsNum++;
            approvedBy[msg.sender] = true;
            
        }
        
        if(approvalsNum == minApprovers ){
            // Warning: Failure condition of 'send' ignored. Consider using 'transfer' instead.
            // beneficiary.transfer(address(this).balance);
            // "send" and "transfer" are only available for objects of type "address payable", not "address".
            beneficiary.send(address(this).balance);
            selfdestruct(owner);
        }
    }
    
    function reject() public {
        require(isApprover[msg.sender], "Not an approver");
        
        selfdestruct(owner);
    }
    
}