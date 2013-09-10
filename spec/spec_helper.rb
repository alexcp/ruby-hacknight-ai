require_relative '../lib/player'

set :environment, :test

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true        
  config.include Rack::Test::Methods
end