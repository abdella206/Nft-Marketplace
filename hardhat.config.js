require("@nomiclabs/hardhat-waffle");
const fs = require("fs")
const privateKey = fs.readFileSync(process.env.SECRET).toString()
const projectId = "9f426a214d39475685e70473a3b568e0"



module.exports = {
  networks: {
    hardhat: {
      chainId: 1337
    },
    mumbai:{
      url: `https://polygon-mumbai.infura.io/v3/${projectId}`,
      accounts: [privateKey]
    },
    mainnet: {
      url: `https://polygon-mumbai.infura.io/v3/${projectId}`,
      accounts: [privateKey]
    }
  },
  solidity: "0.8.4",
};
