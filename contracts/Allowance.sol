// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Allowance is Ownable {

  using SafeMath for uint;

  mapping(address => uint) public allowance;
  event AllowanceChanged(address indexed _forWho, address indexed _byWhom, uint _prevAmount, uint _curAmount);

  function isOwner() internal view returns(bool) {
    return owner() == msg.sender;
  }

  function addAllowance(address _who, uint _amount) public onlyOwner {
    allowance[_who] = _amount;
  }

  modifier OwnerOrAllowed(uint _amount) {
    require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed!");
    _;
  }

  function reduceAllowance(address _who, uint _amount) internal OwnerOrAllowed(_amount) {
    emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who].sub(_amount));
    allowance[_who] = allowance[_who].sub(_amount);
  }

}
