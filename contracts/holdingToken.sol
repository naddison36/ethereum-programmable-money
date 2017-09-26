
pragma solidity ^0.4.15;

import {TokenInterface} from "./tokenInterface.sol";

contract HoldingToken {
    address public underlyingToken;
    address public wrapperToken;

    event Collect(uint amount);

    function HoldingToken(address _underlyingToken, address _wrapperToken) {
        underlyingToken = _underlyingToken;
        wrapperToken = _wrapperToken;
    }

    function collect() returns (uint amount) {
        require(wrapperToken == msg.sender);

        // TODO is this needed? Won't the following transfer fail anyway? Or does the exception not get throw up to this contract?
        amount = TokenInterface(underlyingToken).balanceOf(this);
        assert(amount > 0);

        TokenInterface(underlyingToken).transfer(wrapperToken, amount);

        Collect(amount);
    }
}