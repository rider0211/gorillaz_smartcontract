# how to deply smart contract on main net
- config hardhat.config.js
const PRIVATE_KEY = ""; 

PRIVATE_KEY is the priavte key of wallet which smart contract will be deployed on.
You can get the private key from metamask.
https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-export-an-account-s-private-key

ex : const PRIVATE_KEY = "3903e09c87194bec2f48b4b1039e26df367f979c66edd58d155ba5edb2fdd186"; 


const APIKEY = ""

APIKEY is the user's apikey of avax network who deploy smart contract.
1. User has to sign up to snowtract.io website.
2. User can get the api key in his account.

ex : const APIKEY = "3EFD6SUZFDAX6NKB8ISE9Y41QPSRTWX2KX"

- npm install

- run windows prompt in this directory and type like as follows.
npx hardhat deploy:cavamainnet

copy address of smartcontract to clipboard to verify.

- verify smart contract

npx hardhat verify "smartcontract address" --network avalanche