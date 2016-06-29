require 'bundler'
Bundler.require :default

# IPC = true
IPC = false

# standalone
#
IPC_PATH = nil # will use the default
# IPC_PATH = "#{ENV["HOME"]}/eth-db/bapp/geth.ipc" # legacy in bapp as well T_T
#
# default IPC path: ~/.ethereum/geth.ipc


# dockerized
#
DOCKER_VOLUMES = "/var/lib/docker/volumes" # linux
IPC_PATH = "#{DOCKER_VOLUMES}/datadir/_data/geth.ipc"

# RPC (default)
#
RPC_HOST = "localhost"
RPC_PORT = "8545"


require_relative '../lib/rubeth'

path = File.expand_path "../../", __FILE__
PATH = path


# TODO: add cross-platform support
#
# DOCKER_VOLUMES = "..." # osx
# DOCKER_VOLUMES = "..." # win
