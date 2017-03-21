require "bundler/setup"
require "rack/test"
require "sabayon_middleware"

require "support/rack_app"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
