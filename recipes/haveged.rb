package('haveged') { action :install }
service 'haveged' do
  supports status: true, start: true, stop: true, restart: true, reload: true
  action [:enable, :start]
end
