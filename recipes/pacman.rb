# Write pacman.conf

template '/etc/pacman.conf' do
  mode '0644'
  owner 'root'
  source 'pacman.conf.erb'
  variables(node['archlinux']['pacman'])
  notifies :run, 'ruby_block[refresh]', :immediately
end

ruby_block 'refresh' do
  action :nothing
  block do
    Mixlib::ShellOut.new("pacman -Sy").run_command
  end
end
