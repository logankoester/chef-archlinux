require 'spec_helper'

describe 'archlinux::haveged' do
  before do
    Fauxhai.mock(path: 'spec/fixtures/arch.json') do |node|
    end
  end

  cached(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  it 'installs the haveged package' do
    expect(chef_run).to install_package('haveged')
  end

  it 'enables the haveged service' do
    expect(chef_run).to enable_service 'haveged'
  end

  it 'starts the haveged service' do
    expect(chef_run).to start_service 'haveged'
  end
end

