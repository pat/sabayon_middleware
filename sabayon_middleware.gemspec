# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sabayon_middleware/version'

Gem::Specification.new do |spec|
  spec.name          = "sabayon_middleware"
  spec.version       = SabayonMiddleware::VERSION
  spec.authors       = ["Pat Allan"]
  spec.email         = ["pat@freelancing-gods.com"]

  spec.summary       = "Simple Rack middleware for use with Sabayon."
  spec.homepage      = "https://github.com/pat/sabayon_middleware"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rack"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec"
end
