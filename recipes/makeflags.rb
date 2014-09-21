# Set your MAKEFLAGS to optimize makepkg
# See https://wiki.archlinux.org/index.php/Makepkg

execute 'Set MAKEFLAGS' do
  flags = node['archlinux']['MAKEFLAGS']
  command "sed -i 's/^#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"#{flags}\"/g' /etc/makepkg.conf"
end
