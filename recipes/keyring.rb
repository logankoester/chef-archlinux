bash 'Generate a fresh pacman keyring' do
  code <<-EOH
    rm -fr /etc/pacman.d/gnupg
    pacman-key --init
    pacman-key --populate archlinux
    touch /etc/pacman.d/gnupg/.chef-regenerate
  EOH
  not_if { ::File.exists?('/etc/pacman.d/gnupg/.chef-regenerate') }
end

node['archlinux']['pacman-keys'].each do |key_id|
  bash 'Sign unofficial developer keys' do
    code <<-EOH
      pacman-key -r #{key_id}
      pacman-key --lsign #{key_id}
    EOH
  end
end
