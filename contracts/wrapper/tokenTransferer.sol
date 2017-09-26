
pragma solidity ^0.4.15;

import {TokenInterface} from "../tokenInterface.sol";

contract TokenTransferer {
    // the tokens which need to be transferred
    TokenInterface public tokenContract;

    // the ultimate receiver of the tokens. This can be an externally managed account or a contract.
    address public receiver;

    // Event emitted when the tokens are transferred from this contract to the receiver
    event Transfer(uint amount);

    function TokenTransferer(address _tokenAddress, address _receiver) {
        tokenContract = TokenInterface(_tokenAddress);
        receiver = _receiver;
    }

    // transfers all the tokens controlled by this contract to the receiver
    function transfer() returns (uint amount) {
        require(receiver == msg.sender);

        // TODO is this needed? Won't the following transfer fail anyway? Or does the exception not get throw up to this contract?
        amount = tokenContract.balanceOf(this);
        assert(amount > 0);

        tokenContract.transfer(receiver, amount);

        Transfer(amount);
    }
}