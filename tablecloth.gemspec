# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tablecloth/version'

Gem::Specification.new do |spec|
  spec.name          = 'tablecloth'
  spec.version       = Tablecloth::VERSION
  spec.authors       = ['Adam Whittingham']
  spec.email         = ['adam@devmountain.co.uk']

  spec.summary       = 'A nice way of parsing text tables into Arrays or Hashes '
  spec.description   = 'A nice way of parsing text tables into Ararys or Hashes, for clearer code. Great for tests and permissions matrixes!'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rake-n-bake'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rubycritic'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fasterer'
end
