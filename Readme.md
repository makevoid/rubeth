# RubEth

Playing with `ethereum-ruby`, creating a wrapper class to get result data formatted correctly and raise custom errors

Current status:
- connect, ask balance, list address and not much


### Setup

    bundle

### Run

    ruby rubeth.rb


This will print some infos about your node like coinbase and balance.


### Run with docker

Prerequisites:

  - Docker is required to run with docker :D
  - Nothing else (you don't need to have ruby installed)

Check that docker works

    docker ps

Run the Rubeth docker container it:

    ./run

The first time it will fail because of ipc permissions


### Run with IPC

Edit the configs in env `config/env.rb`


### Installing geth --dev docker container

    docker pull makevoid/ethereum-geth-dev

### Starting geth --dev as a pre-built container

Docker required (obviously):

    docker run -p 8545:8545 makevoid/ethereum-geth-dev

Then use http://localhost:8545 (or empty, because these are the defaults) in your Ethereum RPC apps.

### Starting geth manually

If you're **starting geth manually**....

Copy the default genesis.json config:

    cp config/genesis.default.json config/genesis.json


Edit conifg/gensis.json and replace ADDRESS with your ethereum address (you need to call `eth.coinbase` / `eth.getCoinbase` from a geth console - you can `geth attach` for example)  
...otherwise you're good
