# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'megaphone/version'

Gem::Specification.new do |gem|
  gem.name          = "megaphone"
  gem.version       = Megaphone::VERSION
  gem.authors       = ["MrPowers"]
  gem.email         = ["matthewkevinpowers@gmail.com"]
  gem.description   = %q{Centralizes RequestMaker, Notificator, and Campfire for use by all appliactions}
  gem.summary       = %q{Centralizes RequestMaker, Notificator, and Campfire for use by all appliactions}
  gem.homepage      = ""

  gem.add_development_dependency "stathat"
  gem.add_development_dependency "tinder"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end