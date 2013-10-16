# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reskribe_api/version'

Gem::Specification.new do |spec|
  spec.name          = "reskribe_api"
  spec.version       = ReskribeApi::VERSION
  spec.authors       = ["Esteban Uscanga"]
  spec.email         = ["esteban@liquidlabs.de"]
  spec.description   = %q{Ruby gem for accesing to Reskribe API}
  spec.summary       = %q{Reskribe API Ruby Gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"  
end
