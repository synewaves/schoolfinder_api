module SchoolfinderApi
  # Configuration options
  class Configuration
    # @return [String] HTTP host (defaults to +api.education.com+)
    attr_accessor :host
    
    # @return [Integer] HTTP port (defaults to +80+)
    attr_accessor :port
    
    # @return [String] relative service path (defaults to +service/service.php+)
    attr_accessor :path
    
    # @return [String] SchoolFinder API key. See {http://www.education.com/schoolfinder/tools/webservice/}.
    attr_accessor :key
    
    # @return [Integer] HTTP connection timeout seconds (defaults to +2+)
    attr_accessor :http_open_timeout
    
    # @return [Integer] HTTP read timeout seconds (defaults to +2+)
    attr_accessor :http_read_timeout
    
    # @private
    def initialize
      self.host              = "api.education.com"
      self.port              = 80
      self.path              = "service/service.php"
      self.http_open_timeout = 2
      self.http_read_timeout = 2
    end
  end
end