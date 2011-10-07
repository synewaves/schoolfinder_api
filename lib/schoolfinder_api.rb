require "schoolfinder_api/version"
require "schoolfinder_api/configuration"
require "schoolfinder_api/request"
require "schoolfinder_api/functions"
require "schoolfinder_api/models"
require "schoolfinder_api/models/schools"
require "schoolfinder_api/models/school"

# Top-level interface to SchoolfinderApi
module SchoolfinderApi
  # Call this method to modify defaults in your initializers.
  #
  # @example
  #   SchoolfinderApi.configure do |configuration|
  #     configuration.key = "abcd1234"
  #   end
  #
  # @yield [Configuration] The current configuration.
  def self.configure
    yield(configuration)
  end
  
  # @return [Configuration] Current configuration.
  def self.configuration
    @@configuration ||= Configuration.new
  end
end