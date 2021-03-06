bash 'Generate a fresh pacman keyring' do
  code <<-EOH
    rm -fr /etc/pacman.d/gnupg
    pacman-key --init
    pacman-key --populate archlinux
    touch /etc/pacman.d/gnupg/.chef-regenerate
    dirmngr </dev/null
  EOH
  not_if { ::File.exists?('/etc/pacman.d/gnupg/.chef-regenerate') }
  notifies :run, 'ruby_block[sign_keys]', :immediately
end

ruby_block 'sign_keys' do
  action :nothing
  block do
    node['archlinux']['pacman-keys'].each do |key_id|
      Mixlib::ShellOut.new("pacman-key -r #{key_id};
        pacman-key --lsign #{key_id}").run_command
    end
    Mixlib::ShellOut.new("pacman -Sy").run_command
  end
end
