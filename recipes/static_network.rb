# Configure static networking
# https://www.linode.com/docs/networking/linux-static-ip-configuration#arch-linux-1

static = node['static_network']

service 'systemd-networkd' do
  provider Chef::Provider::Service::Systemd if node['platform'] =~ /arch|manjaro/
  supports status: true, start: true, stop: true, restart: true, reload: true
  action ['enable']
end

link '/etc/systemd/network/10-dhcp.network' do
  to '/dev/null'
  only_if do
    static && static['name'] && static['addresses'] && static['gateway']
  end
end

template '/etc/systemd/network/50-static.network' do
  mode '0644'
  source '50-static.network.erb'
  variables({
    :name => node['static_network']['name'],
    :addresses => node['static_network']['addresses'],
    :gateway => node['static_network']['gateway']
  })
  only_if do
    static && static['name'] && static['addresses'] && static['gateway']
  end
  notifies :restart, 'service[systemd-networkd]'
end
