#
# Cookbook Name:: archlinux
# Recipe:: default
#
# Copyright (C) 2013 Logan Koester
# 
# All rights reserved - Do Not Redistribute
#

# Chef's SystemD provider is hardcoded to /bin, which is incorrect on Arch Linux.
if node['platform'] == 'arch'
  link '/bin/systemctl' do
    to '/usr/bin/systemctl'
  end
end
