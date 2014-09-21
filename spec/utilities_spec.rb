require 'chefspec'

describe 'archlinux::utilities' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs "tree"' do
    expect(chef_run).to install_pacman_package('tree')
  end
end
