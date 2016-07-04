source "http://rubygems.org"

DOCKER = ENV["DOCKER"] == "1"

# gem "ethereum", github: "DigixGlobal/ethereum-ruby"
# stable_may = "42237f4124800edd9e1c9917632fd4f18b9cec39"
# gem "ethereum", github: "DigixGlobal/ethereum-ruby", ref: stable_may

unless DOCKER
  gem "ethereum", path: "~/apps/ethereum-ruby"
  # gem "ethereum", github: "makevoid/ethereum-ruby"
else
  gem "ethereum", github: "makevoid/ethereum-ruby"
end
gem "hashie", require: "hashie/mash"
