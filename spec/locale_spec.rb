require 'spec_helper'

describe 'archlinux::locale' do
  before do
    Fauxhai.mock(path: 'spec/fixtures/arch.json') do |node|
    end
  end

  cached(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['archlinux']['locales'] = [
        'foo', 'bar'
      ]
    end.converge(described_recipe)
  end

  # TODO assertions...

end
