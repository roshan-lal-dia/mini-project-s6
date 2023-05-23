var Election = artifacts.require("../contracts/Election.sol");

module.exports = function(deployer) {
    deployer.deploy(Election);
};
