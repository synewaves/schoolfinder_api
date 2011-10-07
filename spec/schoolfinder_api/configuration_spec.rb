require "spec_helper"

describe SchoolfinderApi::Configuration do
  it { should have_configuration_option(:host).default("api.education.com") }
  it { should have_configuration_option(:port).default(80) }
  it { should have_configuration_option(:path).default("service/service.php") }
  it { should have_configuration_option(:key).default(nil) }
  it { should have_configuration_option(:http_open_timeout).default(2) }
  it { should have_configuration_option(:http_read_timeout).default(2) }
end