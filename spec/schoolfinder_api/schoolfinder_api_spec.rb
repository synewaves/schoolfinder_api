require "spec_helper"

describe SchoolfinderApi do
  it "allows setting configuration as a block" do
    SchoolfinderApi.configure do |config|
      config.http_open_timeout = 10
      config.http_read_timeout = 30
    end
    
    SchoolfinderApi.configuration.http_open_timeout.should == 10
    SchoolfinderApi.configuration.http_read_timeout.should == 30
  end
end