default['archlinux']['locales'] = [
  'en_US.UTF-8 UTF-8',
  'en_US ISO-8859-1'
]

default['archlinux']['system_locale'] = 'en_US.UTF-8'

# Number of cores to use when compiling packages with makepkg
default['archlinux']['MAKEFLAGS'] = '-j2'

# Default attributes for updatedb job
default['updatedb']['hour'] = '0'
default['updatedb']['minute'] = '0'
default['updatedb']['mailto'] = 'root@localhost'

# Default packages to install
default['archlinux']['packages']['install'] = [
  'iotop',
  'tree',
  'htop',
  'ncdu',
  'jnettop',
  'ranger',
  'nmap',
  'expect',
  'multitail',
  'dnsutils',
  'nethogs',
  'rxvt-unicode-terminfo',
  'rsync',
  'strace',
  'the_silver_searcher',
  'gvim',
  'vim-systemd',
  'tmux',
  'autojump',
  'pkgfile',
  'libxslt'
]

# Default packages to remove
default['archlinux']['packages']['remove'] = ['vim']
