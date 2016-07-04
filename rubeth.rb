require_relative 'config/env'

# start geth
#
# for example:
#
#     geth --genesis config/genesis.json --dev console
#


eth = Rubeth.new


# puts "Coinbase:"
# puts eth.eth.eth_coinbase

puts "Coinbase:"
puts eth.coinbase
puts

balance = eth.get_balance eth.coinbase

puts "Balance:"
puts "#{balance} wei"
puts


accounts = eth.accounts

puts "Accounts:"
accounts.each do |acc|
  bal = eth.get_balance acc
  puts "#{acc} (#{bal} wei)"
end
puts


block_num = eth.block_number

puts "Latest block number:"
puts block_num
puts


block = eth.get_block_by_number block_num, false
# puts eth.get_block_by_number block, true # returns the full block infos

puts "Latest block:"
puts block[:hash]
puts

txs = block.transactions || []

puts "Transactions in the block:"
txs.each do |tx|
  puts tx
end
puts


tx_latest_hash = txs.last
tx_latest = eth.get_transaction_by_hash tx_latest_hash if tx_latest_hash

puts "Transaction infos - #{tx_latest_hash}:"
if tx_latest
  puts "from:     #{tx_latest.from}"
  puts "to:       #{tx_latest.to}"
  puts "gas:      #{eth.to_i tx_latest.gas}"
  puts "gasPrice: #{eth.to_i tx_latest.gasPrice}"
end

# -------------

# wait_time = 3  # geth tuned
wait_time = 10 # parity antani

init = Ethereum::Initializer.new "#{PATH}/contracts/SimpleStorage.sol", eth.eth
init.build_all
simple_storage = SimpleStorage.new
begin
 simple_storage.deploy_and_wait wait_time
rescue RuntimeError => e
  puts "deploy_and_wait failed (timeout) - Probably geth's ethCode is still buggy"
end

puts "------------"
p    simple_storage.deployment
puts simple_storage.deployment.contract_address
puts "------------"
exit

simple_storage.at "0x2db7f12be27d2a5a1731487cdde151ae059d98bc"

data = simple_storage.call_raw_data
puts "data:"
p data
puts


tx = simple_storage.transact_and_wait_set_data "a"
puts "tx:"
p tx
sleep 3
puts

data = simple_storage.call_raw_data
puts "data:"
p data
puts

# run this file this:
#
# ruby rubeth.rb
