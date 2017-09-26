Wrapper Token
=============

A wrapper token is a ERC20 token contract that is in control of an underlying ERC20 token. This new token can add new constraints on the underlying tokens. Example constraints are when the new token can be sent, the amount that can be sent, who can send the token and who can receive the token.

## Problem
There needs to be a way to transfer control of the underlying token from an user's wallet (Externally Owned Account) to the wrapper contract. This can not be done via the wrapper contract as all calls to the underlying token from the wrapper contract will have a message sender (msg.sender) of the wrapper contract and not the externally owned account that initiated the call to the wrapper contract.

The externally owned account can't directly transfer control to the wrapper contract as the wrapper will not know who to credit its wrapper tokens to. You could add an extract address parameter to the transfer function to indicate to the wrapper contract who the wrapped tokens are for, but that will break the ERC 20 interface.

You could allow the tokens to be transferred by the wrapper contract but that means anyone can claim those tokens in the wrapper contract.

## Solution
Use an intermediate contract to hold the underlying tokens which only the wrapper contract can then transfer the underlying tokens to itself.

1. The issuer calls the createTokenTransferer function on the wrapper contract to create a new token transferer contract that is associated with the issuer in the wrapper contract.
2. The issuer calls the transfer function on underlying contract to transfer the underlying tokens to transferer contract.
3. The issuer calls the issue function on the wrapper contract which then calls the transfer function on the transferer contract to transfer the underlying tokens from the transferer contract to the wrapper contract.

## Technical Artifacts
* [wrapperToken.sol](./wrapperToken.sol) solidity code for the ERC20 wrapper contract
* [WrapperToken.abi](../../bin/contracts/wrapper/WrapperToken.abi) Application Binary Interface definition of the wrapper contract.
* [WrapperToken.bin](../../bin/contracts/wrapper/WrapperToken.bin) Binary in hex format of the wrapper contract

