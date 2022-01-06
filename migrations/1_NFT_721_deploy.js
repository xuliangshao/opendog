var NFT721 = artifacts.require("NFT721");

module.exports = function(deployer) {
  deployer.then(function() {
    const singer = "0xa54f62f28b2C69b703A63ae78c5Baf3baa57fC01";
    return deployer
      .deploy(NFT721, "FingerNFT", "FingerNFT", singer, "ipfs:/", "ipfs:/")
      .then(function(token) {
        console.log(`NFT721 is deployed at ${token.address}`);
      });
  });
};
