#
# Cookbook Name:: archlinux
# Recipe:: default
#
# Copyright (C) 2013 Logan Koester
# 
# All rights reserved - Do Not Redistribute
#

if node['platform'] == 'arch'

  # Chef's SystemD provider is hardcoded to /bin, which is incorrect on Arch Linux.
  link '/bin/systemctl' do
    to '/usr/bin/systemctl'
  end

  # https://wiki.archlinux.org/index.php/Locale
  ruby_block 'Enable desired locales' do
    block do
      locales = ['en_US.UTF-8 UTF-8', 'en_US ISO-8859-1']

      lg = Chef::Util::FileEdit.new('/etc/locale.gen')
      locales.each do |locale|
        lg.search_file_replace_line(/^##{locale}$/, locale)
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

end
