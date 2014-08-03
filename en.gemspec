# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'en/version'

Gem::Specification.new do |spec|
  spec.name          = 'en'
  spec.version       = EN::VERSION
  spec.authors       = ['Victor Rodrigues']
  spec.email         = ['victorc.rodrigues@gmail.com']
  spec.summary       = 'Simple ENV fetcher'
  spec.homepage      = 'https://github.com/rodrigues'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_dependency 'dotenv'
end
