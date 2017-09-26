
pragma solidity ^0.4.15;

import {TokenInterface} from "./tokenInterface.sol";
import {IssuableTransferToken} from "./issuableTransferToken.sol";
import {HoldingToken} from "./holdingToken.sol";

contract WrapperToken is IssuableTransferToken
{
    TokenInterface private underlyingToken;

    // Map of externally owned accounts to holding contracts
    mapping(address => address) private holdingContracts;

    function WrapperToken(address tokenAddress, string tokenSymbol, string tokenName)
        // call base constructor
        IssuableTransferToken(tokenSymbol, tokenName)
    {
        underlyingToken = TokenInterface(tokenAddress);
        // TODO validate that the address is a TokenInterface
    }

    function createHoldingContract()
    {
        holdingContracts[msg.sender] = new HoldingToken(address(underlyingToken), address(this), msg.sender);
    }

    // calls the holding contract of the message sender to transfer the underlying tokens from the holding contract to this wrapper contract
    function issue()
    {
        HoldingToken(holdingContracts[msg.sender]).collect();

        // issue escrow tokens to this
        totSupply += amount;
        balance[toAddress] += amount;
        Transfer(0x0, toAddress, amount);
    }

    // // transfers control of the underlying token to this escrow contract
    // function issue(address toAddress, uint amount)
    // {
    //     // transfer the underlying token to this contract
    //     // this needs to be executed as the msg.sender
    //     underlyingToken.transfer(this, amount);

    //     //TODO does a throw need to be caught here?

    //     // issue escrow tokens to this
    //     totSupply += amount;
    //     balance[toAddress] += amount;
    //     Transfer(0x0, toAddress, amount);
    // }

    function redeem(address toAddress, uint amount)
    {
        // check the redeemer has enough tokens to redeem from this contract
        require(balance[msg.sender] >= amount);
        totSupply -= amount;
        balance[msg.sender] -= amount;

        // transfer the underlying token from this contract to nominated receiver
        // this needs to be executed as the this contract
        underlyingToken.transfer(toAddress, amount);

        Transfer(msg.sender, 0x0, amount);
    }
}