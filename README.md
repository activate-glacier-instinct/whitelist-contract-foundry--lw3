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

# Local testing (Anvil)

1. Start Anvil

`anvil`

This will create a local network and generate some accounts and addresses

2. Update script/{contract} to create an instance for the contract

3. Set $PRIVATE_KEY

`export PRIVATE_KEY="{one_of_the_generated_anvil_addresses}"`

4. Deploy 

`forge script script/{contractScript}.s.sol:{contractScript} --fork-url http://localhost:8545 \
--private-key $PRIVATE_KEY --broadcast`

5. Take a note of contract address

6. Set $CONTRACT_ADDRESS

`export CONTRACT_ADDRESS="{contract_addr}"`

7.a Test contract properties using cast call

`cast call $CONTRACT_ADDRESS "maxWhitelistedAddresses()"`

`cast call $CONTRACT_ADDRESS "numAddressesWhitelisted()"`

7.b Test contract methods using cast send

`cast send $CONTRACT_ADDRESS "addAddressToWhitelist()" --private-key $PRIVATE_KEY`