module SchoolfinderApi
  module Models
    # Schools data
    class Schools < Base
      # @return [Array<School>] array of schools
      attr_accessor :schools
      
      protected
      
      # @private
      def parse
        
        super
        
        return if !success?
        
        @schools = []
        @parser.xpath('//record').children.each do |elm|
          @schools << School.new(elm.to_xml)
        end
      end
    end
  end
end