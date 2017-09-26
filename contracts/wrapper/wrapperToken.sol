
pragma solidity ^0.4.15;

import {TokenInterface} from "../tokenInterface.sol";
import {Token} from "../token.sol";
import {TokenTransferer} from "./tokenTransferer.sol";

contract WrapperToken is Token
{
    TokenInterface private underlyingToken;

    // Map of externally owned accounts to holding contracts
    mapping(address => address) private tokenTransferers;

    function WrapperToken(address tokenAddress, string tokenSymbol, string tokenName)
        // call constructor on super contract
        Token(tokenSymbol, tokenName)
    {
        underlyingToken = TokenInterface(tokenAddress);
        // TODO validate that the address is a TokenInterface
    }

    // create a new token transferer contract that is associated with the issuer (message sender).
    // this is the first of three setups to transfer the underlying tokens to the wrapper contract
    function createTokenTransferer() returns (address collectorAddress)
    {
        // the message sender mist not have already created a token transferer
        require(tokenTransferers[msg.sender] > 0);

        // the underlying contract is set as the token contract to collect tokens from
        // this wrapper contract is set as the collector
        collectorAddress = tokenTransferers[msg.sender] = new TokenTransferer(address(underlyingToken), address(this));
    }

    // calls the issuer's token transferer contract to transfer the underlying tokens from the transferer contract to this wrapper contract
    function issue(address toAddress) returns (uint amount)
    {
        amount = TokenTransferer(tokenTransferers[msg.sender]).transfer();

        //TODO does a throw need to be caught here?

        // issue new wrapped tokens to specified account
        totSupply += amount;
        balance[toAddress] += amount;

        // remove the token transferer for the issuer
        tokenTransferers[msg.sender] = 0;

        Transfer(0x0, toAddress, amount);
    }

    // redeems the wrapper tokens and transfers the underlying tokens from this wrapper contract to the toAddress
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