# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unit_4_multivers/version'

Gem::Specification.new do |spec|
  spec.name          = "unit_4_multivers"
  spec.version       = Unit4Multivers::VERSION
  spec.authors       = ["Laurens Nutma"]
  spec.email         = ["laurensnutma@gmail.com"]
  spec.summary       = %q{Gem handling the REST API on https://api.online.unit4.nl/V14 with oauth2}
  #spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  # Testing
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "oauth2"
  spec.add_dependency "json"
  spec.add_dependency "mime-types"

end
