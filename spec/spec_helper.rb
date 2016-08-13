require 'simplecov'
SimpleCov.coverage_dir 'log/coverage/spec'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'tablecloth'
