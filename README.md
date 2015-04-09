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

## Usage

Set the required attributes, and add the recipes you desire to your run list. For most cases,
you can use the default recipe that includes everything.

## Attributes

See `attributes/default.rb` for details

## Recipes


  * Optimizes makepkg build flags

### chef

Schedules the chef-client to run once an hour.

### cron

Configures both [cronie](https://wiki.archlinux.org/index.php/cron) and [systemd timers](https://wiki.archlinux.org/index.php/Systemd/cron_functionality)

### default

Everything.

### haveged

A daemon that generates system entropy

### hostname

Sets the machine hostname and creates an associated hostsfile entry.

### keyring

Generate a fresh pacman keyring.

Additionally, you may add unofficial developer keys to the array attribute `node['archlinux']['pacman-keys']`. Each value should be the `keyid` for a key that has been published to a keyserver. Each key will be imported and locally signed so that pacman can install packages signed with these keys.

### locale

Generates & enables the desired locales.

### makeflags

Set your MAKEFLAGS to optimize makepkg.

### mlocate

Installs [mlocate](https://wiki.archlinux.org/index.php/Mlocate) and schedules index updates.

### pacman

Writes `/etc/pacman.conf` from a template. You may add extra repositories like
this:

```json
"archlinux": {
  "pacman": {
    "repositories": [
      {
        "name": "myrepo",
        "sig_level": "Optional TrustAll",
        "server": "http://myrepo.example"
      }
    ]
  }
}
```

### pacaur

Installs `cower` and its `pacaur` frontend for convenient interaction with AUR.

### packages

Add and remove system packages from a list.

### ruby_shadow

Install ruby-shadow with [chef_gem](https://docs.chef.io/resource_chef_gem.html). This is an optional dependency of the [user resource](https://docs.chef.io/resource_user.html).

## Author

Copyright (c) 2014-2015 [Logan Koester](http://logankoester.com). Released under the MIT license. See `LICENSE` for details.
