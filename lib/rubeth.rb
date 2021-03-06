class Rubeth
  DEBUG = false
  # DEBUG = true # uncomment to debug

  attr_reader :eth

  def initialize
    @eth = if IPC
      # Ethereum::IpcClient.new # default, ~/.ethereum (in $HOME)
      Ethereum::IpcClient.new  IPC_PATH
    else
      Ethereum::HttpClient.new RPC_HOST, RPC_PORT
      # Ethereum::HttpClient.new < TODO: implement defaults like with IPC client good defaults
    end
  end

  # this defines all the method - same as https://github.com/DigixGlobal/ethereum-ruby/blob/master/lib/ethereum/ipc_client.rb
  Ethereum::IpcClient::RPC_COMMANDS.each do |command|
    meth = "#{command.split("_")[1].underscore}"
    command = command.underscore
    define_method meth do |*args|
      resp = @eth.send command, *args
      p resp if DEBUG
      conv meth, resp["result"]
    end
  end

  # please add more conversions here and submit a PR, thanks
  #
  def conv(meth, result)
    case meth
    when /balance|block_number/
      hex2int result # hex string represents an integer
    when /antani/
      hex2str result
    when /get_block|get_transaction/
      Hashie::Mash.new result
    else
      result
    end
  end

  def hex2int(hex_string)
    hex_string && hex_string.to_i(16)
  end
  alias :to_i :hex2int

  def hex2str(hex_string) # hex string to string (for unformatted data)
     [hex_string[2..-1]].to_a.pack "H*"
  end
  alias :to_s :hex2str

end
