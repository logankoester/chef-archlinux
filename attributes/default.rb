default[:archlinux][:locales] = [
  'en_US.UTF-8 UTF-8',
  'en_US ISO-8859-1'
]

# Number of cores to use when compiling packages with makepkg
default[:archlinux]['MAKEFLAGS'] = '-j2'
