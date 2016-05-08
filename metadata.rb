name             'archlinux'
maintainer       'Logan Koester'
maintainer_email 'logan@logankoester.com'
license          'MIT'
description      'Recipes to manage core system properties for Arch Linux'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url 'https://github.com/logankoester/chef-archlinux'
issues_url 'https://github.com/logankoester/chef-archlinux/issues'
version '0.9.4'
supports 'arch'

depends 'pacman'
depends 'hostsfile'

attribute 'archlinux/locales',
  display_name:  'Locales',
  description: 'Enable these locales',
  type: 'array',
  required: 'optional',
  recipes: ['archlinux::locale'],
  default: ['en_US.UTF-8 UTF-8', 'en_US ISO-8859-1']

attribute 'archlinux/system_locale',
  display_name: 'System locale',
  description: 'System-wide locale',
  type: 'string',
  required: 'required',
  recipes: ['archlinux::locale'],
  default: ['en_US.UTF-8']
