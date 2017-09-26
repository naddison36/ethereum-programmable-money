/*
An ERC20 token without the pull functions: approve, allowance and transferFrom methods

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
See MIT Licence for further details.
<https://opensource.org/licenses/MIT>.
*/

pragma solidity ^0.4.15;

import {TransferToken} from "./TransferToken.sol";

contract IssuableTransferToken is TransferToken
{
    address owner;

    // constructor
    function IssuableTransferToken(string symbol, string name) TransferToken(symbol, name) {
        owner = msg.sender;
    }
    
    event Issue(
        address indexed toAddress,
        uint256 amount);

    event Redeem(
        address indexed fromAddress,
        uint256 amount);

    function issue(address toAddress, uint amount) public
    {
        require(owner == msg.sender);
        totSupply += amount;
        balance[toAddress] += amount;
        Issue(toAddress, amount);
        Transfer(0x0, toAddress, amount);
    }
    
    function redeem(uint amount) public
    {
        require(balance[msg.sender] >= amount);
        totSupply -= amount;
        balance[msg.sender] -= amount;
        Redeem(msg.sender, amount);
        Transfer(msg.sender, 0x0, amount);
    }
}