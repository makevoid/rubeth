# IPC
## docker: makevoid/ethereum-geth-dev-ipc-root

If you just needs IPC and you're not interested in Docker, then just edit `config/env`

IPC = true

IPC_PATH = "" # set it if you don't want Rubeth to use the default "~/.ethereum/geth.ipc"

### Permissions:

To use ipc you can use this `./set_permissions` bash script

### Pull:

The container you need to pull is:

    makevoid/ethereum-geth-dev-ipc-root


The pull command is:

    docker pull makevoid/ethereum-geth-dev-ipc-root


### Hubs:

docker: <https://hub.docker.com/r/makevoid/ethereum-geth-dev-ipc-root>
git:    <https://github.com/makevoid/ethereum-geth-dev-ipc-root>
