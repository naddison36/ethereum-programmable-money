/*
An ERC20 token without the pull functions: approve, allowance and transferFrom methods

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
See MIT Licence for further details.
<https://opensource.org/licenses/MIT>.
*/

pragma solidity ^0.4.15;

contract TransferToken
{
    /* State */
    // The Total supply of tokens
    uint totSupply;
    
    /// @return Token symbol
    string sym;
    string nam;

    uint8 public decimals = 8;
    
    // Token ownership mapping
    mapping (address => uint) balance;

/* Events */
    // Triggered when tokens are transferred.
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value);

/* Funtions Public */

    // Constructor
    function TransferToken(string tokenSymbol, string tokenName)
    {
        sym = tokenSymbol;
        nam = tokenName;
    }

    function symbol() public constant returns (string)
    {
        return sym;
    }

    function name() public constant returns (string)
    {
        return nam;
    }
    
    // Using an explicit getter allows for function overloading    
    function totalSupply() public constant returns (uint)
    {
        return totSupply;
    }
    
    // Using an explicit getter allows for function overloading    
    function balanceOf(address holderAddress) public constant returns (uint)
    {
        return balance[holderAddress];
    }

    // Send amount amount of tokens to address _to
    function transfer(address toAddress, uint256 amount) public
    {
        address fromAddress = msg.sender;
        require(amount <= balance[fromAddress]);
        balance[fromAddress] -= amount;
        balance[toAddress] += amount;
        Transfer(fromAddress, toAddress, amount);
    }
}