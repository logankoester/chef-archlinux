if node['platform'] =~ /arch|manjaro/
  include_recipe 'archlinux::locale'
  include_recipe 'archlinux::makeflags'
end
