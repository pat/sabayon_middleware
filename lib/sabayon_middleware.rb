module SabayonMiddleware
  #
end

require "sabayon_middleware/middleware"
require "sabayon_middleware/pairs"
require "sabayon_middleware/version"

require "sabayon_middleware/railtie" if defined?(Rails::Railtie)
