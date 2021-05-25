# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tableware/version'

Gem::Specification.new do |spec|
  spec.name          = 'tableware'
  spec.version       = Tableware::VERSION
  spec.authors       = ['Adam Whittingham']
  spec.email         = ['adam.whittingham+gems@gmail.com']

  spec.summary       = 'A nice way of parsing text tables into Arrays or Hashes '
  spec.description   = 'A nice way of parsing text tables into Ararys or Hashes for clearer code. Great for tests & permissions matrixes!'
  spec.homepage      = 'https://github.com/AdamWhittingham/tableware'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r(^exe/)) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rake-n-bake'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rubycritic'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fasterer'
  spec.add_development_dependency 'semver2'
end
