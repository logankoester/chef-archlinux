package('mlocate') { action :install }

cron 'updatedb' do
  hour node['updatedb']['hour']
  minute node['updatedb']['minute']
  mailto node['updatedb']['mailto']
  command 'updatedb'
  action :create
end
