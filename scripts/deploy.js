const hre = require('hardhat')
const dotenv = require('dotenv')
const fs = require('fs')

async function main () {
  process.env.IS_RUNNING = true
  const VMGCTestTransfer = await hre.ethers.getContractFactory('VMGCTestTransfer')
  const vmgctransfer = await VMGCTestTransfer.deploy("0xA3E75829F47C4F8e9A230b7474ac1FA757fc8E21")
  console.log('deployed to:', vmgctransfer.address)
}
// async function main () {
//   process.env.IS_RUNNING = true
//   const VMGCTest = await hre.ethers.getContractFactory('VMGCTest')
//   const vmgcTestToken = await VMGCTest.deploy("0x29ce52C97F5A49E0D8A02b9Deae0F4862FE73B7F","0x29ce52C97F5A49E0D8A02b9Deae0F4862FE73B7F","0x29ce52C97F5A49E0D8A02b9Deae0F4862FE73B7F");
//   console.log('deployed to:', vmgcTestToken.address)
// }

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error)
    process.exit(1)
  })
