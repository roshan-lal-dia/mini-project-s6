
## SET UP INSTRUCTIONS
### Project demo video link
Open ganache and select quick start ethereum.

Open your browser and configure metamask. Create a wallet and store your```Secret Recovery Phrase``` in a safe place.

#### Connecting metamask and ganache
1. In metamask, go to settings > networks > add network. You can also get to this by clicking the metamask extension pinned on your browser > clicking the profile picture > settings > networks > add network
2. Give your network any name of choice. 
3. For New RPC URL go to ganache where you'll copy the RPC server url and paste in Metamask. 
4. Chain ID for ganache is 1337. 
5. You can name currency symbol as "ETH" and save. 

#### Importing an account from ganache to metamask
1. Open ganache and select show keys on any account. The show keys button is the key icon.
2. Copy the private key and click done.
3. Open the metamask menu which can be accessed by clicking the profile picture and select import account.
4. Paste the private key copied from ganache and click import.

#### Cloning the project


cd blockchain-voting-system

npm i

truffle compile

truffle migrate (for first time) 

truffle migrate --reset (Every time you open Ganache)
 
npm start

The project will open in the browser and metamask will ask you to select an account. Select the account we had imported earlier.


### danson added a new code 

