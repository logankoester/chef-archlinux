package('mlocate') { action :install }
package('cronie') { action :install }

service 'cronie' do
  provider Chef::Provider::Service::Systemd if node['platform'] =~ /arch|manjaro/
  supports status: true, start: true, stop: true, restart: true, reload: true
  action [:enable, :start]
end

cron 'updatedb' do
  hour node[:updatedb][:hour]
  minute node[:updatedb][:minute]
  mailto node[:updatedb][:mailto]
  command 'updatedb'
  action :create
end
