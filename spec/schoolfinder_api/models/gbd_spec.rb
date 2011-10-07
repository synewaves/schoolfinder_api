require "spec_helper"

describe SchoolfinderApi::Models::Gbd do
  it "populates the data" do
    data = SchoolfinderApi::Models::Gbd.new(get_xml('gbd.xml'))
    
    data.logosrc.should == "http://www.education.com/i/logo/edu-logo-75x31.jpg"
    data.disclaimer.should == "&#169;Education.com, Inc. 2010.  Use is subject to Terms of Service."
    data.lsp.should == ""
    data.lsc.should == ""
    data.lsrs.should == ""
    data.lsr.should == ""
  end
end