# archlinux cookbook

Recipes to manage core system properties for Arch Linux

## Installation

Using [Berkshelf](http://berkshelf.com/), add the archlinux cookbook to your Berksfile.

```ruby
cookbook 'archlinux'
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

## aufs_friendly recipe

> This recipe is highly experimental and should be treated with caution.

Installs the aufs-compatible linux kernel and modules.

See https://aur.archlinux.org/packages/linux-aufs_friendly/

### Usage

Run `recipe[archlinux::aufs_friendly]` manually, then reboot.

### Attributes

See `attributes/default.rb` for examples.

### Services

Chef tries to use rc.d when it detects Arch. Chef comes with a SystemD service provider. For each service, specify it like so:

```ruby
service 'YOUR_SERVICE' do
  provider Chef::Provider::Service::Systemd if node['platform'] == 'arch'
end
```

## Author

Author:: Logan Koester (<logan@logankoester.com>)
