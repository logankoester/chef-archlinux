require 'spec_helper'

describe 'archlinux::journald' do
  before do
    Fauxhai.mock(path: 'spec/fixtures/arch.json') do |node|
    end
  end

  cached(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['archlinux']['journald'] = {
        storage: 'chefspec'
      }
    end.converge(described_recipe)
  end

  it 'renders the journald.conf template' do
    expect(chef_run).to render_file('/etc/systemd/journald.conf').with_content(/Storage=chefspec/)
  end
end
