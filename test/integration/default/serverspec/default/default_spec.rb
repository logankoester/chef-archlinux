require 'spec_helper'

# disable_predictable_network_interface_names
describe interface('eth0') do
  it { should exist }
  it { should be_up }
end
