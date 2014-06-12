bash 'Set hostname' do
  code "hostnamectl set-hostname #{node['machinename']}"
end

hostsfile_entry node['ipaddress'] do
  hostname node['machinename']
  aliases [ node['hostname'] ]
  action :create
end

ohai 'reload' do
  action :reload
end
