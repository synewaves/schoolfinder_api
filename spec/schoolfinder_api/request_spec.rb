require "spec_helper"

describe SchoolfinderApi::Request, ".get" do
  let(:request)  { stub("Request",  :get  => response) }
  let(:response) { stub("Response", :body => '<?xml version="1.0" encoding="utf-8"?>', :code => 200) }
  let(:key)      { "abcdef1234567890" }

  before do
    SchoolfinderApi::Request.stubs(:uri).returns("/")
    SchoolfinderApi::Request.stubs(:request).returns(request)
  end

  it "constructs the request URI" do
    SchoolfinderApi::Request.get("/", :option => 1)
    SchoolfinderApi::Request.should have_received(:uri).with("/", :option => 1)
  end

  it "includes access key when configured" do
    SchoolfinderApi.configuration.key = key
    SchoolfinderApi::Request.get("/")
    SchoolfinderApi::Request.should have_received(:uri).with("/", :key => key)
  end

  it "allows overriding of configured access key" do
    SchoolfinderApi.configuration.key = key
    SchoolfinderApi::Request.get("/", :key => "1283091280")
    SchoolfinderApi::Request.should have_received(:uri).with("/", :key => "1283091280")
  end

  it "makes an API request" do
    SchoolfinderApi::Request.get("/")
    request.should have_received(:get).with("/")
  end

  it "returns the XML for a successful response" do
    SchoolfinderApi::Request.get("/").should == '<?xml version="1.0" encoding="utf-8"?>'
  end

  it "returns false for any response code other than 200" do
    response.stubs(:code => "401")
    SchoolfinderApi::Request.get("/").should == false
  end
end

describe SchoolfinderApi::Request, ".request" do
  it "creates a new HTTP client" do
    SchoolfinderApi::Request.request.should be_a(Net::HTTP)
  end

  it "connects to configured host and port" do
    SchoolfinderApi::Request.request.address.should == SchoolfinderApi.configuration.host
    SchoolfinderApi::Request.request.port.should    == SchoolfinderApi.configuration.port
  end

  it "sets configured open and read timeouts" do
    SchoolfinderApi::Request.request.open_timeout.should == SchoolfinderApi.configuration.http_open_timeout
    SchoolfinderApi::Request.request.read_timeout.should == SchoolfinderApi.configuration.http_read_timeout
  end
end

describe SchoolfinderApi::Request, ".uri" do
  it "generates a request path and query string based on parameters" do
    SchoolfinderApi::Request.uri("schoolSearch", { :key_with_spaces => 12, :normal => "maybe", :camelCased => 1340}).should == "/service/service.php?f=schoolSearch&sn=sf&v=4&Resf=xml&camelCased=1340&key_with_spaces=12&normal=maybe"
  end
end