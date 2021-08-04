// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract SharedWallet is Ownable {

  function isOwner() internal view returns(bool) {
    return owner() == msg.sender;
  }
  
  function withdrawMoney(address payable _to, uint _amount) public onlyOwner {
    _to.transfer(_amount);
  }

  receive() external payable {

  }

}
