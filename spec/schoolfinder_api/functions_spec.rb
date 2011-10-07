require "spec_helper"

describe SchoolfinderApi::Functions do
  describe "school_search" do
    let(:request)  { stub("Request", :get => response) }
    let(:response) { stub("Response", :body => "", :code => 200) }
    
    it "requires state option if passing city option" do
      lambda {
        SchoolfinderApi::Functions.school_search({ :city => 'Baton Rouge' })
      }.should raise_error(ArgumentError, "The state option is required if also using the city option")
    end
    
    it "requires distance option if passing latitude or longitude option" do
      lambda {
        SchoolfinderApi::Functions.school_search({ :latitude => 90 })
      }.should raise_error(ArgumentError, "The distance option is required if also using the latitude or longitude option")
    end
    
    it "fetches the XML" do
      SchoolfinderApi::Request.stubs(:request).returns(request)

      response = SchoolfinderApi::Functions.school_search({ :city => 'Baton Rouge', :state => 'LA' })
      response.should be_an_instance_of(SchoolfinderApi::Models::Schools)
    end
  end
end