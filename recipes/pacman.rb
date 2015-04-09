# Write pacman.conf

template '/etc/pacman.conf' do
  mode '0644'
  owner 'root'
  source 'pacman.conf.erb'
  variables(node['archlinux']['pacman'])
end
