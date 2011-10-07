require 'cgi'
require 'net/http'
require 'uri'

module SchoolfinderApi
  # @private
  # HTTP request manager
  class Request
    # Makes the request to the web service.
    #
    # @param [String] path     Web service name.
    # @param [Hash]   options  Request options.
    # @return [String, Boolean] XML on success, false if not.
    def self.get(path, options = {})
      key = SchoolfinderApi.configuration.key

      unless key.nil?
        options[:key] ||= key
      end

      response = request.get(uri(path, options))

      case response.code.to_i
      when 200
        response.body
      else
        false
      end
    end
    
    # gets the request object.
    #
    # @return [Net::HTTP] HTTP object.
    def self.request
      http = Net::HTTP.new(SchoolfinderApi.configuration.host, SchoolfinderApi.configuration.port)
      
      http.open_timeout = SchoolfinderApi.configuration.http_open_timeout
      http.read_timeout = SchoolfinderApi.configuration.http_read_timeout
      http
    end
    
    # Generate the url for the request.
    # 
    # @param [String] function Web service function name.
    # @param [Hash]   options  Request options.
    def self.uri(function, options = {})
      path = SchoolfinderApi.configuration.path
      "/#{path}?f=#{function}&sn=sf&v=4&Resf=xml&#{hash_to_query_string(options)}"
    end

    # Turns request options into query string.
    #
    # @param [Hash] hash Request options.
    # @return [String] Formatted query string.
    def self.hash_to_query_string(hash)
      hash = hash.sort_by { |key, value|
        key.to_s
      }.delete_if { |key, value|
        value.to_s.empty?
      }.collect { |key, value|
        "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}"
      }
      
      hash.join("&")
    end
  end
end