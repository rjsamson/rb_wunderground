# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rb_wunderground/version'

Gem::Specification.new do |gem|
  gem.name          = "rb_wunderground"
  gem.version       = RbWunderground::VERSION
  gem.authors       = ["Robert J Samson"]
  gem.email         = ["rjsamson@me.com"]
  gem.description   = %q{A simple wrapper for the Weather Underground JSON API}
  gem.summary       = %q{A simple wrapper for the Weather Underground JSON API}
  gem.homepage      = ""

  gem.add_runtime_dependency "json", "~> 1.7"
  gem.add_runtime_dependency "httparty", "~> 0.9"
  gem.add_development_dependency "rspec", "~> 2.11"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
