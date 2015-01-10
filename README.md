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

### locale

Generates & enables the desired locales.

### makeflags

Set your MAKEFLAGS to optimize makepkg.

### mlocate

Installs [mlocate](https://wiki.archlinux.org/index.php/Mlocate) and schedules index updates.

### pacaur

Installs `cower` and its `pacaur` frontend for convenient interaction with AUR.

### packages

Add and remove system packages from a list.

### ruby_shadow

Install ruby-shadow with [chef_gem](https://docs.chef.io/resource_chef_gem.html). This is an optional dependency of the [user resource](https://docs.chef.io/resource_user.html).

## Author

Copyright (c) 2014-2015 [Logan Koester](http://logankoester.com). Released under the MIT license. See `LICENSE` for details.
