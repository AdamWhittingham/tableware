require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake-n-bake'

RSpec::Core::RakeTask.new(:spec)

task default: %i[
  bake:rspec
  bake:coverage:check_specs
  bake:rubocop
  bake:rubycritic
  bake:fasterer
  bake:ok_rainbow
]
