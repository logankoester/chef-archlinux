# Arch Linux cookbook
> [Chef](http://getchef.com/) recipes to manage core system properties for [Arch Linux](http://archlinux.org).

[![Build Status](http://ci.ldk.io/logankoester/chef-archlinux/badge)](http://ci.ldk.io/logankoester/chef-archlinux/)
[![Gittip](http://img.shields.io/gittip/logankoester.png)](https://www.gittip.com/logankoester/)

## Installation

Using [Berkshelf](http://berkshelf.com/), add the `archlinux` cookbook to your Berksfile.

```ruby
cookbook 'archlinux', github: 'logankoester/chef-archlinux', branch: 'master'
```
Then run `berks` to install it.

## default recipe

  * Generates & enables the desired locales
  * Optimizes makepkg build flags

### Usage

Add `recipe[archlinux::default]` to your run list.

## utilities recipe

Installs some commonly desired system packages. 

### Usage

Add `recipe[archlinux::utilities]` to your run list.

## pacaur recipe

Installs `cower` and its `pacaur` frontend for convenient interaction
with AUR.

### Usage

Add `recipe[archlinux::pacaur]` to your run list.


## mlocate recipe

Installs mlocate and schedules an updatedb job for `mlocate` every hour
via cron.

### Usage

Add `recipe[archlinux::mlocate]` to your run list.

## cron recipe

Installs both cronie and systemd cron functionality.

See https://wiki.archlinux.org/index.php/Systemd/cron_functionality

### Usage

Add `recipe[archlinux::cron]` to your run list.

## chef recipe

Create, enable and start a systemd service that runs chef-client hourly to
converge the node.

### Usage

Add `recipe[archlinux::chef]` to your run list.

## hostname recipe

Sets the hostname and creates an /etc/hosts entry from `node['machinename']`.

### Usage

Add `recipe[archlinux::hostname]` to your run list.

## Attributes

See `attributes/default.rb` for examples.

## Services

Chef tries to use rc.d when it detects Arch. Chef comes with a SystemD service provider. For each service, specify it like so:

```ruby
service 'YOUR_SERVICE' do
  provider Chef::Provider::Service::Systemd if node['platform'] == 'arch'
end
```

## Author

Copyright (c) 2014 [Logan Koester](http://logankoester.com). Released under the MIT license. See `LICENSE` for details.
