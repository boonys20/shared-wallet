// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Allowance is Ownable {

  using SafeMath for uint;

  function isOwner() internal view returns(bool) {
    return owner() == msg.sender;
  }

  mapping(address => uint) public allowance;

  function addAllowance(address _who, uint _amount) public onlyOwner {
    allowance[_who] = _amount;
  }

  modifier OwnerOrAllowed(uint _amount) {
    require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed!");
    _;
  }

  function reduceAllowance(address _who, uint _amount) internal OwnerOrAllowed(_amount) {
    allowance[_who] -= _amount;
  }

}

contract SharedWallet is Allowance {

  event MoneySent(address indexed _beneficiary, uint _amount);
  event MoneyReceived(address indexed _from, uint _amount);

  function withdrawMoney(address payable _to, uint _amount) public OwnerOrAllowed(_amount) {
    require(_amount <= address(this).balance, "Contract doesn't own enough money");
    if(!isOwner()) {
      reduceAllowance(msg.sender, _amount);
    }
    emit MoneySent(_to, _amount);
    _to.transfer(_amount);
  }

  receive() external payable {
    emit MoneyReceived(msg.sender, msg.value);
  }

}
