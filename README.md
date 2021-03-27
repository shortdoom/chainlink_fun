# Retrving Link Feeds

This is just a very limited in capability contract showing a possible way to retrive a price feed address from chainlink relating to specified token. Useful when you need to get price data for multiple tokens and do not know what token will that be.

Currently supports only hardcoded loading and doesn't distinguish between ETH/USD feeds. If token has two available feeds you need to expand your mapping or build separate mappings for each pair.

## Usage

There is no tests. Just ran `deploy.ts`.

### Pre Requisites

Before running any command, make sure to install dependencies:

```sh
$ yarn install
```

### Compile

Compile the smart contracts with Hardhat:

```sh
$ yarn compile
```

### Run deploy.ts

`npx hardhat run scripts/deploy.ts`
