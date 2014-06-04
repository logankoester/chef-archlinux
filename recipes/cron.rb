# Set up cronie

package('cronie') { action :install }

service 'cronie' do
  provider Chef::Provider::Service::Systemd if node['platform'] =~ /arch|manjaro/
  supports status: true, start: true, stop: true, restart: true, reload: true
  action [:enable, :start]
end

# Set up systemd timers
# See https://wiki.archlinux.org/index.php/Systemd/cron_functionality

TIMERS = %w{hourly daily weekly monthly yearly}

TIMERS.each do |timer|
  directory "/etc/systemd/system/timer-#{timer}.target.wants" do
    action :create
  end

  template "/etc/systemd/system/timer-#{timer}.timer" do
    mode '0644'
    source "timer-#{timer}.timer.erb"
  end

  template "/etc/systemd/system/timer-#{timer}.target" do
    mode '0644'
    source "timer-#{timer}.target.erb"
  end
end

TIMERS.each do |timer|
  service "timer-#{timer}.timer" do
    provider Chef::Provider::Service::Systemd if node['platform'] =~ /arch|manjaro/
    supports status: true, start: true, stop: true, restart: true, reload: true
    action [:enable, :start]
  end
end
