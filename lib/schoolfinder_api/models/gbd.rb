module SchoolfinderApi
  module Models
    # GBD data
    class Gbd < Base
      
      # @return [String] The education.com logo image linking to www.education.com/schoolfinder.
      attr_accessor :logosrc
      
      # @return [String] Disclaimer text.
      attr_accessor :disclaimer
      
      # @return [String] A link to the corresponding school profile on education.com.
      attr_accessor :lsp
      
      # @return [String] A link to school search results page on education.com for the corresponding city and state.
      attr_accessor :lsc
      
      # @return [String] A link to the corresponding school profile on education.com.
      attr_accessor :lsrs
      
      # @return [String] A link to the corresponding school profile on education.com.
      attr_accessor :lsr
      
      # @return [String] A link to a district profile page when the optional parameter, districtid, is in use.
      attr_accessor :lsd
      
      protected
      
      def parse
        super
        
        return if !success?
        
        @logosrc = @parser.xpath('//logosrc').text
        @disclaimer = @parser.xpath('//disclaimer').text
        @lsp = @parser.xpath('//lsp').text
        @lsc = @parser.xpath('//lsc').text
        @lsrs = @parser.xpath('//lsrs').text
        @lsr = @parser.xpath('//lsr').text
        @lsd = @parser.xpath('//lsd').text
      end
    end
  end
end