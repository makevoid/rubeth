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



