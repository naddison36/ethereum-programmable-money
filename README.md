Ethereum Implementation of Programmable Money
=============================================

## What is money?
Money is an accepted medium of exchange for goods and services. In Australia, the accepted medium of exchange is the Australian dollar.

A payment is the transfer of an amount of money from a sender to a receiver at a point in time.

## Properties of programmable money
Programmable money having the following properties:

### The attributes of a payment can be codified.
The ability to dynamically calculate when a payment is sent, the amount, the sender and the receiver. This is not unique to programmable money. Tradition payment instructions also have  this ability.

### Constraints can be placed on the attributes of a payment.
These conditions include restricting when a payment can be made, the amount that can be sent, the authorised sender or the allowed recipients of money. These conditions are introduced by the sender of the money and can not be removed by the receiver.
Programmable money can be extended to include new constraints without losing the existing constraints. As its base you can take unrestricted programmable money and extend it to include a set of constraints. For example, can only be spent after a fixed period of time. This can then be further extended. For example, the money can only be transferred to a limited set of receivers.

### Atomic transactions
Programs can orchestrate the exchange of digital assets and money between multiple parties for different amounts in one atomic transaction. Atomic transactions mean all payments are executed or none at all. This is often implemented in a smart contract which ensures transactions that involve the exchange of digital assets are valid.

### Conditions can be preserved after a transfer or they can be removed.
In most cases conditions placed on programmable money will need to be dropped once it has been spent. For example, once a charity has spend the money at approved suppliers, the approved suppliers are free to spend the money wherever they like. When programmable money is being used like a loyalty point, the conditions of use will need to be preserved after it’s been spent.

### Is directly controlled by people or things without needing to instruct an intermediary.
In practical terms, this is the ability to sign and broadcast transactions directly to the digital platform. In traditional payment systems, instructions are sent to a financial institution who then execute the payment in closed payment schemes. This exposes the customer to risk of default of the financial institutions involved in the payment or their funds being frozen.

### Data can be associated with a payment
Supplementary data can be associated with a payment which can be used as input to the money programs or simply used for audit or provenance purposes.

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

### Auctions
To reduce the risk of default on auctions, money can be transferred on the condition that all non-winning bids are refunded at the end of the auction. The seller is also assured of payment as the winner’s bid is held in escrow until the end of the auction or when the auctioned good or service is delivered.

### Loyalty points
Organisations can use programmable money to put conditions on money credited to their customers as a reward for buying goods or services. Specifically, that the money can only be spent at members of the loyalty scheme.

### Direct Debits
Conditions can be placed on money that authorises another party to transfer money from the authorising party for a limited time, amount or number of payments. A classic example is a retail customer authorising a utility to debit them on a periodic basis up to a limited amount for a limited period of time. For example, one payment every month up to $30 for a period of 2 years.
This authorisation can be withdrawn by the authorisor at any time or might been both parties to sign for the removal of the automated payments.
