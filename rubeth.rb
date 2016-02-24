require_relative 'env'

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
