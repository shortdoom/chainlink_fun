import { ethers } from "hardhat";
import { Contract, ContractFactory } from "ethers";

async function main(): Promise<void> {

  const Greeter: ContractFactory = await ethers.getContractFactory("PriceConsumerV3");
  const greeter: Contract = await Greeter.deploy();
  await greeter.deployed();

  console.log("Greeter deployed to: ", greeter.address);

  await getPrice();
  async function getPrice() {
    const price = await greeter.getLatestPrice();
    console.log(price);
  }

}

main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
