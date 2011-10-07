module SchoolfinderApi
  # Interface for the API functions.
  # 
  # Read the more about this API at: {http://www.education.com/webservice/documentation/?section=technicaloverview}
  class Functions
    # Retrieve school profiles for a given area.
    #
    # Read more at: {http://www.education.com/webservice/documentation/?section=schoolsearch.
    #
    # \* If using city option, state is also required. If using latitude/longitude options, distance is required. 
    # 
    # @example
    #   schools = SchoolfinderApi::Functions.school_search({ :city => 'Baton Rouge', :state => 'LA' })
    #   if schools.success?
    #     schools.each do |school|
    #       puts school.id
    #     end
    #   end
    #
    # @param [Hash] options The options for the API request.
    # @option options [String] :nces_id        The National Center for Education Statistics (NCES) id of the school.
    # @option options [String] :schoolid       The Education.com id of the school.
    # @option options [String] :districtid     The internal Education.com id of a school district.
    # @option options [String] :districtleaid  The NCES Local Education Agency (LEA) id of a school district.
    # @option options [String] :zip            A five digit US postal code.
    # @option options [String] :city           The name of a city (*).
    # @option options [String] :county         The name of a county.
    # @option options [String] :state          The two letter abbreviation of a state.
    # @option options [String] :distance       A distance in miles from a specific latitude/longitude. The suggested value is around 1.5 miles.
    # @option options [String] :latitude       A latitude which serves as the center for distance searches (*).
    # @option options [String] :longitude      A longitude which serves as the center for distance searches (*).
    # @option options [String] :minResult      A minimum number of search results to return. The search will be expanded in increments of 0.5 miles until the minresult is reached.
    # @return [Models::Schools] Schools list
    def self.school_search(options = {})
      options = {
        :key => SchoolfinderApi.configuration.key,
        :nces_id => nil,
        :schoolid => nil,
        :districtid => nil,
        :districtleaid => nil,
        :zip => nil,
        :city => nil,
        :county => nil,
        :state => nil,
        :distance => nil,
        :latitude => nil,
        :longitude => nil,
        :minResult => nil,
      }.merge!(options)
    
      if !options[:city].nil? && options[:state].nil?
        raise ArgumentError, "The state option is required if also using the city option"
      elsif (!options[:latitude].nil? || !options[:longitude].nil?) && options[:distance].nil?
        raise ArgumentError, "The distance option is required if also using the latitude or longitude option"
      end
    
      Models::Schools.new(SchoolfinderApi::Request.get("schoolSearch", options))
    end
  end
end