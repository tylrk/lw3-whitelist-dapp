// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const { ethers } = require("hardhat");

async function main() {
  /*
  A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
  so whitelistContract here is a factory for instances of our Whitelist contract.
  */
  const whitelistContract = await ethers.getContractFactory("Whitelist");

  // Deploy the contract; 10 is the max number of whitelisted addys allowed
  const deployedWhitelistContract = await whitelistContract.deploy(10);

  // Wait for it to finish deploying
  await deployedWhitelistContract.deployed();

  // Print addy of deployed contract
  console.log("Whitelist Contract Address: ", deployedWhitelistContract.address);
}

// Call the main function and catch if there is an error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
