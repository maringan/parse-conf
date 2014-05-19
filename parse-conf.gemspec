# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parse/conf'

Gem::Specification.new do |spec|
  spec.name          = "parse-conf"
  spec.version       = Parse::Conf::VERSION
  spec.authors       = ["maringan"]
  spec.email         = ["kamil.kucharski88+1@gmail.com"]
  spec.summary       = %q{Parse standard unix config}
  spec.description   = %q{Parse standard unix config}
  spec.homepage      = "http://github.com/"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
end
