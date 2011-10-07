require 'simplecov'
SimpleCov.start if ENV["COVERAGE"]
SimpleCov.coverage_dir 'coverage'

require File.expand_path("../../lib/schoolfinder_api", __FILE__)
require 'rspec'
require "bourne"

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each do |file|
  require file
end

RSpec.configure do |config|
  config.mock_with :mocha
end

def get_xml(file)
  File.open(File.expand_path("../xml/" + file, __FILE__)).read
end