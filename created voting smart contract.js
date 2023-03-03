
// import web3 library
const Web3 = require('web3');

// connect to Ethereum node
const web3 = new Web3('https://mainnet.infura.io/v3/YOUR-PROJECT-ID');

// set the address and ABI of the contract
const contractAddress = '0x1234567890123456789012345678901234567890';
const contractABI = [
  {
    "inputs": [],
    "name": "getTotalVoteCount",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "bytes32",
        "name": "option",
        "type": "bytes32"
      }
    ],
    "name": "getVoteCount",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "bytes32",
        "name": "option",
        "type": "bytes32"
      }
    ],
    "name": "vote",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  }
];

// create a new contract instance
const contract = new web3.eth.Contract(contractABI, contractAddress);

// vote for an option
contract.methods.vote(web3.utils.asciiToHex('Option A')).send({ from: '0xYOUR-ADDRESS', gas: 200000 })
  .then((receipt) => {
    console.log('Vote successful');
  })
  .catch((error) => {
    console.error(error);
  });

// get the vote count for an option
contract.methods.getVoteCount(web3.utils.asciiToHex('Option A')).call()
  .then((voteCount) => {
    console.log(`Vote count for Option A: ${voteCount}`);
  })
  .catch((error) => {
    console.error(error);
  });

// get the total vote count
contract.methods.getTotalVoteCount().call()
  .then((totalVoteCount) => {
    console.log(`Total vote count: ${totalVoteCount}`);
  })
  .catch((error) => {
    console.error(error);
  });
