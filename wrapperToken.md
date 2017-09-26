Wrapper Token
=============

A wrapper token is a new token contract that is in control of an underlying token. This new token can add new constraints on the underlying token. Example constraints are when the new token can be sent, the amount that can be sent, who can send the token and who can receive the token.

## Problem
Need a way for to transfer control of the underlying token from an user's wallet (Externally Owned Account) to the wrapper contract. This can not be done via the wrapper contract as all calls to the underlying token from the wrapper contract will have a message sender (msg.sender) of the wrapper contract and not the externally owned account that initiated the call to the wrapper contract.

The externally owned account can't directly transfer control to the wrapper contract as the wrapper will not know who to credit its wrapper tokens to. You could add an extract address parameter to the transfer function to indicate to the wrapper contract who the wrapped tokens are for, but that will break the ERC 20 interface.

You could allow the tokens to be transferred by the wrapper contract but that means anyone can claim those tokens in the wrapper contract.

## Solution
Use an intermediate contract to hold the underlying tokens which only the wrapper contract can then transfer to itself.

1. The externally owned account call the wrapper contract to create a new holding token
2. The externally owned account calls the underlying contract to transfer the underlying tokens to the ownership of the holding contract
3. The externally owned account calls the wrapper contract which then calls the holding contract to transfer the underlying tokens from the holding contract to the wrapper contract

