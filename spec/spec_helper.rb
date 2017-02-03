require "rspec-puppet"

fixture_path = File.expand_path File.join(__FILE__, "..", "fixtures")

RSpec.configure do |c|
  c.manifest_dir = File.join(fixture_path, "manifests")
  c.module_path  = File.join(fixture_path, "modules")
end

def default_test_facts
  {
    :boxen_home    => "/test/boxen",
    :boxen_srcdir  => "/test/boxen/src",
    :boxen_user    => "testuser",
  }
end
