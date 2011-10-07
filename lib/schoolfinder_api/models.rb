require "nokogiri"

module SchoolfinderApi
  # Sub module for returned and parsed web service data
  module Models
    # Base class for data models
    class Base
      # @return [String] the raw XML content from the service
      attr_accessor :xml
      
      # @private
      # @return [Nokogiri::XML::Reader] xml parser
      attr_accessor :parser
      
      # @return [String] response message
      attr_accessor :message
      
      # @return [Integer] response code
      attr_accessor :code
    
      # @private
      # Initialize the model
      #
      # @param [String] xml the raw XML from the service
      def initialize(xml)
        if !empty?(xml)
          @xml = xml
          @parser = Nokogiri::XML(xml) { |cfg| cfg.noblanks }
          parse
        else
          @code = -1
          @message = 'Error connecting to remote service.'
        end
      end
    
      # Was the request successful?
      # @return [Boolean] +true+ on successful request
      def success?
        @code.to_i == 0
      end
    
      protected
      
      # @private
      # Parses the xml content
      def parse
        @code = @parser.xpath('/data/faultCode').text.to_i
        @message = @parser.xpath('/data/faultString').text
      end
      
      def empty?(elm)
        elm.respond_to?(:empty?) ? elm.empty? : !elm
      end
    end
  end
end