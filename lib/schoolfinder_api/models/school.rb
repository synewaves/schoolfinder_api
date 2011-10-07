module SchoolfinderApi
  module Models
    # School data
    class School < Base
      
      # @return [String] The Education.com id of the school.
      attr_accessor :id
      
      # @return [String] School name.
      attr_accessor :name
      
      # @return [String] Street address.
      attr_accessor :address
      
      # @return [String] City.
      attr_accessor :city
      
      # @return [String] State.
      attr_accessor :state
      
      # @return [String] ZIP code.
      attr_accessor :zip
      
      # @return [String] Phone number.
      attr_accessor :phonenumber
      
      # @return [String] Latitude.
      attr_accessor :latitude
      
      # @return [String] Longitude.
      attr_accessor :longitude
      
      # @return [String] The internal Education.com id of a school district
      attr_accessor :districtid
      
      # @return [String] The NCES Local Education Agency (LEA) id of a school district.
      attr_accessor :districtleaid
      
      # @return [String] AYP (Adequate Yearly Progress) Result (yes/no).
      attr_accessor :aypresult
      
      # @return [String] AYP (Adequate Yearly Progress) Result year
      attr_accessor :aypresultyear
      
      # @return [String] Distance in miles from a lat/long location.
      attr_accessor :distance
      
      # @return [String] Total student enrollment.
      attr_accessor :enrollment
      
      # @return [String] Grade level.
      attr_accessor :gradelevel
      
      # @return [String] Grades served.
      attr_accessor :gradesserved
      
      # @return [String] School district name.
      attr_accessor :schooldistrictname
      
      # @return [String] School type (public/private).
      attr_accessor :type
      
      # @return [String] Ratio of students to teachers.
      attr_accessor :studentteacherratio
      
      # @return [String] School's website.
      attr_accessor :website
      
      # @return [String] The National Center for Education Statistics (NCES) id of the school
      attr_accessor :ncesid
      
      # @return [String] Education.com school's website.
      attr_accessor :url
      
      # @return [String] Education.com's test rating text.
      attr_accessor :testratingtext
      
      # @return [String] Education.com's test rating image URL (large).
      attr_accessor :testratingimagelarge
      
      # @return [String] Education.com's test rating image URL (small).
      attr_accessor :testratingimagesmall
      
      # @return [String] Education.com's test rating year.
      attr_accessor :testratingyear
      
      protected
      
      # @private
      def parse
        super
        
        return if !success?
        
        @id = @parser.xpath('//schoolid').text
        @name = @parser.xpath('//schoolname').text
        @address = @parser.xpath('//address').text
        @city = @parser.xpath('//city').text
        @state = @parser.xpath('//state').text
        @zip = @parser.xpath('//zip').text
        @phonenumber = @parser.xpath('//phonenumber').text
        @latitude = @parser.xpath('//latitude').text
        @longitude = @parser.xpath('//longitude').text
        @districtid = @parser.xpath('//districtid').text
        @districtleaid = @parser.xpath('//districtleaid').text
        @aypresult = @parser.xpath('//aypresult').text
        @aypresultyear = @parser.xpath('//aypresultyear').text
        @distance = @parser.xpath('//distance').text
        @enrollment = @parser.xpath('//enrollment/total').text
        @gradelevel = @parser.xpath('//gradelevel').text
        @gradesserved = @parser.xpath('//gradesserved').text
        @schooldistrictname = @parser.xpath('//schooldistrictname').text
        @type = @parser.xpath('//schooltype').text
        @studentteacherratio = @parser.xpath('//studentteacherratio/total').text
        @website = @parser.xpath('//website').text
        @ncesid = @parser.xpath('//ncesid').text
        @url = @parser.xpath('//url').text
        @testratingtext = @parser.xpath('//testratingtext').text
        @testratingimagelarge = @parser.xpath('//testratingimagelarge').text
        @testratingimagesmall = @parser.xpath('//testratingimagesmall').text
        @testratingyear = @parser.xpath('//testratingyear').text
      end
    end
  end
end