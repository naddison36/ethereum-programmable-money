Ethereum Implementation of Programmable Money
=============================================

Programable money is attaching conditions to the transfer of money backed tokens. The transfer of tokens from a sender to a receiver, or a more complicated exchange of other asset backed tokens in one atomic transaction.

## Definitions
*Money* is an accepted medium of exchange for goods and services. In Australia, the accepted medium of exchange is the Australian dollar.

A *payment* is the transfer of an amount of money from a sender to a receiver at a point in time.

A *token* is a right to some asset held by the token issuer. The token holder deposits an asset with the token issuer who in turn increases the balance of the token holder's token balance by an agreed asset to token exchange rate. The token holder can then transfer some or all of their tokens to others without the need of an intermediary. See Anthony Lewis's blog [A gentle introduction to tokens](https://bitsonblocks.net/2015/09/28/a-gentle-introduction-to-digital-tokens/) for more details.

An [Ethereum](https://www.ethereum.org/) [ERC20](https://github.com/ethereum/EIPs/issues/20) token conforms to the published token standard. This includes data and functions like balanceOf and transfer that the token must implement. This standard allows different wallets, exchanges, blockchain explorers and smart contracts to interact with tokens.

## Properties of programmable money

### Constraints can be applied to attributes of a payment
These conditions include restricting when a payment can be made, the amount that can be sent, the authorised sender or the allowed recipients of money. For example:
* *when*: only transfer before or after a point in time
* *amount*: only transfer a min or max amount
* *sender*: only a subset of token holders can transfer
* *receiver*: only a subset of token holders can receive tokens. This effectively limits who the token can be transferred to

### Constraints can be based on non-payment data
The payment constraints can be applied based on data that is not part of the payment. In blockchain terms, data can be made available via Oracles which are how external data is made available on a blockchain. Examples include prices (currency, commodity, shares, goods and services), observations (news, weather) or an event in a business process (supply chain, manufacturing or services).

### Constraints can be added and removed
Payment constraints can either be maintained as money moves to different token holders or they can be removed depending on the use case. For example, a constraint could be applied so money can only be transferred to a limited set of receivers at all times. Or it could be money is restricted to a limited set of receivers for one transfer only. The receiver of the transfer is then free to transfer that money to whoever they like.

### Constraints can be extended
Programmable money can be extended to include new constraints without losing the existing constraints. You can take unrestricted programmable money and extend it to include a set of constraints. For example, it can only be spent after a fixed period of time. This can then be further extended to include more constraints. For example, the money it can only be transferred to a limited set of receivers.

### Atomic transactions
Programs can orchestrate the exchange of digital assets and money between multiple parties for different amounts in one atomic transaction. Atomic transactions mean all payments are executed or none at all. This is often implemented in a smart contract which ensures transactions that involve the exchange of digital assets are valid.

### Directly controlled
Programmable money is directly controlled by people or things without needing to instruct an intermediary. In practical terms, this is the ability to sign and broadcast transactions directly to the digital platform. In traditional payment systems, instructions are sent to a financial institution who then execute the payment in closed payment schemes. This exposes the customer to risk of default of the financial institutions involved in the payment or their funds being frozen.

## Why programmable money?
The following is a selection of examples of how programmable money could be used. This is by no means exhaustive and is designed to show how the above properties could be used practically.

### Charity donations
Conditions can be placed on money sent to charities that restrict when that money can be transferred and who it can be sent to. The restriction on who payments can be made to could be pre-approved recipients or authorised parties in a data oracle. Other examples that use the condition of where money can be spent include grants, political donations and welfare payments.

### Delivery versus Payment
Using the property of atomic transactions, digital assets can be exchanged for programmable money in one transaction. This reduces counterparty risk as one party is not left exposed to the other party not honouring their side of the transaction.

A concrete example of this is with AgriDigital who is digitising agricultural commodities. When grain is issued as a digital asset, it can be exchanged for a digital currency in one transaction that does not leave the grower or buyer exposed to counterparty default.

### Crowd Funding
Conditions can be placed on money raised during a crowd sale that will refund all payments if not enough funds have been raised by a point in time. Conditions can also be placed on how quickly the raised funds can be spent and who can send those funds.

### Escrow
Programmable money can be used to hold funds in a trust that is controlled by a third party. In this case, the condition is on who can send escrow funds. This could be a single party or multiple parties that need an m of n signatures to release the funds.

Examples could be money held in trust until a child reaches a certain age. Another example is collateral for a financial transaction.

### Know Your Client / Anti-Money Laundering
Constraints can be placed on transfers so only recipients who have been verified by a Know Your Client transaction (KYC) and Anti-Money Laundering (AML) processes can receive money. This can be provided by different providers via Oracles.

### Auctions
To reduce the risk of default on auctions, money can be transferred on the condition that all non-winning bids are refunded at the end of the auction. The seller is also assured of payment as the winner’s bid is held in escrow until the end of the auction or when the auctioned good or service is delivered.

### Loyalty points
Organisations can use programmable money to put conditions on money credited to their customers as a reward for buying goods or services. Specifically, that the money can only be spent at members of the loyalty scheme.

### Direct Debits
Conditions can be placed on money that authorises another party to transfer money from the authorising party for a limited time, amount or number of payments. A classic example is a retail customer authorising a utility to debit them on a periodic basis up to a limited amount for a limited period of time. For example, one payment every month up to $30 for a period of 2 years.
This authorisation can be withdrawn by the authorisor at any time or might been both parties to sign for the removal of the automated payments.

