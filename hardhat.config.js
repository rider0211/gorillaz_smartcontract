const path = require('path')
require('@nomiclabs/hardhat-waffle')
require("@nomiclabs/hardhat-etherscan")
require('dotenv').config({ path: path.join(__dirname, '/.env') })
require('hardhat-gas-reporter')

const PRIVATE_KEY = "90a367deb562fa6d083eb80f1c67f141e52855d4a63246d8c0cf7762e823fdf4";
const POLYGON_TEST_PRIVATE_KEY = "3903e09c87194bec2f48b4b1039e26df367f979c66edd58d155ba5edb2fdd187";
const POLYGON_MAIN_PRIVATE_KEY = "3903e09c87194bec2f48b4b1039e26df367f979c66edd58d155ba5edb2fdd187";
const APIKEY = "3EFD6SUZFDAX6NKB8ISE9Y41QPSRTWX2KX"
const POLYGON_APIKEY = "4MK1FYBXPH69ANQ9IINC46FF3F4Q7KIJSV";
/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: 'hardhat',
  networks: {
    hardhat: {
      chainId: 1337
    },
    avax: {
      url: "https://api.avax-test.network/ext/bc/C/rpc",
      chainId: 43113,
      accounts: [PRIVATE_KEY]      
    },
    mainnet: {
      url: "https://api.avax.network/ext/bc/C/rpc",
      chainId: 43114,
      accounts: [PRIVATE_KEY],
    },
    matictestnet: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [POLYGON_TEST_PRIVATE_KEY]
    },
    maticmainnet:{
      url: "https://polygon-rpc.com/",
      chainId: 137,
      accounts: [POLYGON_MAIN_PRIVATE_KEY]  
    }
  },
  etherscan: {
    // Your API key for Snowtrace
    // Obtain one at https://snowtrace.io/
    // apiKey: APIKEY
    apiKey : POLYGON_APIKEY
  },
  solidity: {
    version: '0.8.1',
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
}
