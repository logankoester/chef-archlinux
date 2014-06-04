# archlinux cookbook

Recipes to manage core system properties for Arch Linux

## Installation

Using [Berkshelf](http://berkshelf.com/), add the archlinux cookbook to your Berksfile.

```ruby
cookbook 'archlinux', git: 'git@git.ldk.io:logankoester/gibson.git', rel: 'cookbooks/archlinux', branch: 'master'
```

Then run `berks` to install it.

## Usage

Add `recipe[archlinux::default]` to your run list.

### Services

Chef tries to use rc.d when it detects Arch. Chef comes with a SystemD service provider. For each service, specify it like so:

```ruby
service 'YOUR_SERVICE' do
  provider Chef::Provider::Service::Systemd if node['platform'] == 'arch'
end
```

## Author

Author:: Logan Koester (<logan@logankoester.com>)
