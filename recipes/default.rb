#
# Cookbook Name:: archlinux
# Recipe:: default
#
# Copyright (C) 2013 Logan Koester
# 
# All rights reserved - Do Not Redistribute
#

if node['platform'] =~ /arch|manjaro/

  # https://wiki.archlinux.org/index.php/Locale
  ruby_block 'Enable desired locales' do
    block do
      locales = node[:archlinux][:locales]
      lg = Chef::Util::FileEdit.new('/etc/locale.gen')
      locales.each do |locale|
        lg.search_file_replace_line(/^##{Regexp.escape(locale)}/, locale)
      end
      lg.write_file
    end
  end

  execute 'Generate locales' do
    command 'locale-gen'
  end

  execute 'Set system-wide locale' do
    command 'localectl set-locale LANG="en_US.UTF-8"'
  end

  execute 'Optimize makepkg' do
    flags = node[:archlinux]['MAKEFLAGS']
    command "sed -i 's/^#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"#{flags}\"/g' /etc/makepkg.conf"
  end

end
