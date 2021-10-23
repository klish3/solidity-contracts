// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract HelloWorldZ {
    string public msgZ;
    
    function setMsg(string memory newMsgZ) public {
        msgZ = newMsgZ;
    }
}