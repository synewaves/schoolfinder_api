require "spec_helper"

describe SchoolfinderApi::Models::Base do
  it "catches error responses" do
    data = SchoolfinderApi::Models::Base.new(get_xml('general_failure.xml'))
    
    data.code.should == 2
    data.message.should == "invalid parameters:  both city and state must be set"
  end
  
  it "fails if empty XML" do
    data = SchoolfinderApi::Models::Base.new("")
    
    data.success?.should be_false
    data.code.should == -1
    data.message.should == "Error connecting to remote service."
  end
  
  it "fails if nil XML" do
    data = SchoolfinderApi::Models::Base.new(nil)
    
    data.success?.should be_false
    data.code.should == -1
    data.message.should == "Error connecting to remote service."
  end
  
  it "fails if passed false" do
    data = SchoolfinderApi::Models::Base.new(false)
    
    data.success?.should be_false
    data.code.should == -1
    data.message.should == "Error connecting to remote service."
  end
  
  it "saves raw XML" do
    data = SchoolfinderApi::Models::Base.new(get_xml('general_failure.xml'))
    
    data.xml.should == get_xml('general_failure.xml')
  end
end