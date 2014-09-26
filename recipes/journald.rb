template '/etc/systemd/journald.conf' do
  mode '0644'
  owner 'root'
  source 'journald.conf.erb'
  variables(node['archlinux']['journald'])
end
