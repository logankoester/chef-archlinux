require 'spec_helper'

describe 'archlinux::packages' do
  before do
    Fauxhai.mock(path: 'spec/fixtures/arch.json') do |node|
    end
  end

  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['archlinux']['packages']['install'] = ['foo-package']
      node.set['archlinux']['packages']['remove'] = ['bar-package']
    end.converge(described_recipe)
  end

  it 'installs packages from node attribute' do
    expect(chef_run).to install_package('foo-package')
  end

  it 'remotes packages from node attribute' do
    expect(chef_run).to remove_package('bar-package')
  end
end

