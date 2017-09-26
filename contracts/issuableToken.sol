/*
An ERC20 token without the pull functions: approve, allowance and transferFrom methods

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
See MIT Licence for further details.
<https://opensource.org/licenses/MIT>.
*/

pragma solidity ^0.4.15;

import {Token} from "./token.sol";

contract IssuableToken is Token
{
    address owner;

    // constructor
    function IssuableToken(string symbol, string name)
        // call constructor of base contract
        Token(symbol, name)
    {
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