bash 'Generate a fresh pacman keyring' do
  code <<-EOH
    rm -fr /etc/pacman.d/gnupg
    pacman-key --init
    pacman-key --populate archlinux
    touch /etc/pacman.d/gnupg/.chef-regenerate
  EOH
  not_if { ::File.exists?('/etc/pacman.d/gnupg/.chef-regenerate') }
end
