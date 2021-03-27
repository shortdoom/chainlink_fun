import { ethers } from "hardhat";
import { Contract, ContractFactory } from "ethers";
var fs = require("fs");

async function main(): Promise<void> {

  const feeds = await fs.readFileSync("scripts/feeds.txt", "utf-8").split('\n');
  const tokens = await fs.readFileSync("scripts/tokens.txt", "utf-8").split('\n');

  const GetPrice: ContractFactory = await ethers.getContractFactory("PriceConsumerV3");
  const getprice: Contract = await GetPrice.deploy(tokens, feeds);
  await getprice.deployed();

  console.log("Contract deployed to: ", getprice.address);

  await getPrice();

  async function getPrice() {
    const feed = await getprice.getFeedForToken(tokens[0]);
    console.log("Token", tokens[0], "feed is", feed);
  }

}

main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
