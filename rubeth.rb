require_relative 'config/env'

# start geth
#
# for example:
#
#     geth --genesis config/genesis.json --dev console
#


eth = Rubeth.new

puts "Coinbase:"
puts eth.coinbase
puts

balance = eth.get_balance "0"

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

puts "Transactions in the block:"
block.transactions.each do |tx|
  puts tx
end
puts


tx_latest_hash = block.transactions.last
tx_latest = eth.get_transaction_by_hash tx_latest_hash

puts "Transaction infos - #{tx_latest_hash}:"
puts "from:     #{tx_latest.from}"
puts "to:       #{tx_latest.to}"
puts "gas:      #{eth.to_i tx_latest.gas}"
puts "gasPrice: #{eth.to_i tx_latest.gasPrice}"


# -------------

init = Ethereum::Initializer.new "#{PATH}/contracts/SimpleStorage.sol", eth.eth
init.build_all
simple_storage = SimpleStorage.new
simple_storage.deploy_and_wait(10)
simple_storage.at "0x8b08c285b63beb7772e98b7ed1dec2294f853050"

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
