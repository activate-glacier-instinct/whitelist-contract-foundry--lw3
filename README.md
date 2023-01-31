# Whitelist dApp

> Foundry project

Whitelist dApp from the LearnWeb3 - Sophomore curriculum


# Description

I'm implementing and porting the dApp project to Foundry. 

Because of this I'm first keeping track of tasks and stories I need to implement from the original hardhat project.

All tasks will be store here - [TODO.md](./TODOs.md)

# Useful commands

- Build `forge build`
- Test `forge test`
- Test verbose `forge test -vv` 
- Run coverage report `forge coverage` 
    - Coverage debug `forge coverage --report debug` 

# Local Deploy / Testing (Anvil)

1. Start Anvil

`anvil`

This will create a local network and generate some accounts and addresses

2. Update script/{contract} to create an instance for the contract

3. Set PRIVATE_KEY

`export PRIVATE_KEY="{one_of_the_generated_anvil_addresses}"`

4. Deploy 

`forge script script/{contractScript}.s.sol:{contractScript} --fork-url http://localhost:8545 \ --private-key $PRIVATE_KEY --broadcast`

5. Take a note of contract address

6. Set CONTRACT_ADDRESS

`export CONTRACT_ADDRESS="{contract_addr}"`

7.a Test contract properties using cast call

`cast call $CONTRACT_ADDRESS "maxWhitelistedAddresses()"`

`cast call $CONTRACT_ADDRESS "numAddressesWhitelisted()"`

7.b Test contract methods using cast send

`cast send $CONTRACT_ADDRESS "addAddressToWhitelist()" --private-key $PRIVATE_KEY`

# Deploying - Goerli / Alchemy RPC

1.a Setup a Metamask wallet

1.b Add wallet private key to `.env` as PRIVATE_KEY

2.a Create a new app on Alchemy / Goerli 

2.b Copy HTTPS key from the app to the `.env` as GOERLI_RPC_URL

3.a Create Etherscan account 

3.b Create and copy Etherscan api key to `.env` as ETHERSCAN_API_KEY

4. Get some test Eth from a faucet  

- https://chaindrop.org (low amounts 0.005)
- https://faucet.paradigm.xyz (requires 50 twitter followers)

5. Configure the script to handle deployment https://book.getfoundry.sh/tutorials/solidity-scripting

6.a Source `.env`

`source .env`

6.b Configure foundry to use `.env` values

```
[rpc_endpoints]
goerli = "${GOERLI_RPC_URL}"

[etherscan]
goerli = { key = "${ETHERSCAN_API_KEY}" }

```

7. Deploy script 

`forge script script/{contractScript}.s.sol:{contractScript} --rpc-url $GOERLI_RPC_URL --broadcast --verify -vvvv`

8. Record the new contract address

`export CONTRACT_ADDRESS="{contract_addr}"`

9. Test the contract properties from Goerli contract

`cast call $CONTRACT_ADDRESS "maxWhitelistedAddresses()" --rpc-url $GOERLI_RPC_URL`

`cast call $CONTRACT_ADDRESS "maxWhitelistedAddresses()" --rpc-url $GOERLI_RPC_URL`

10. Test the contract methods from Goerli contract

`cast send $CONTRACT_ADDRESS "addAddressToWhitelist()" --private-key $PRIVATE_KEY --rpc-url $GOERLI_RPC_URL`