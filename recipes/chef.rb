# Create, enable and start a systemd service that runs chef-client
# hourly to converge the node

template '/etc/systemd/system/chef-client.service' do
  mode '0644'
  source 'chef-client.service.erb'
end

service 'chef-client' do
  provider Chef::Provider::Service::Systemd if node['platform'] =~ /arch|manjaro/
  supports status: true, start: true, stop: true, restart: true, reload: true
  action [:enable, :start]
end
