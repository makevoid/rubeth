require 'bundler'
Bundler.require :default


# standalone
#
# IPC_PATH = "#{ENV["HOME"]}/eth-db/bapp/geth.ipc"


# dockerized
#
DOCKER_VOLUMES = "/var/lib/docker/volumes" # linux
IPC_PATH = "#{DOCKER_VOLUMES}/datadir/_data/geth.ipc"




require_relative '../lib/rubeth'

path = File.expand_path "../../", __FILE__
PATH = path


# TODO: add cross-platform support
#
# DOCKER_VOLUMES = "..." # osx
# DOCKER_VOLUMES = "..." # win
