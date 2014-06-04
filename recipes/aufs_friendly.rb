include_recipe 'pacman'

%w{ abs grub xmlto docbook-xsl bc }.each do |pkg|
  package(pkg) { action :install }
end

bash 'fetching kernel package files' do
  cwd Chef::Config[:file_cache_path]
  code 'ABSROOT=. abs core/linux'
  not_if 'modinfo aufs'
end

bash 'extracting config from currently running kernel' do
  cwd File.join(Chef::Config[:file_cache_path], 'core', 'linux')
  code 'zcat /proc/config.gz > .config'
  not_if 'modinfo aufs'
end

bash 'configuring PKGBUILD to use oldconfig' do
  cwd File.join(Chef::Config[:file_cache_path], 'core', 'linux')
  code "sed -i 's/#make oldconfig/make oldconfig/g' PKGBUILD"
  not_if 'modinfo aufs'
end

bash 'fetching linux-aufs_friendly from AUR' do
  cwd Chef::Config[:file_cache_path]
  code "wget https://aur.archlinux.org/packages/li/linux-aufs_friendly/linux-aufs_friendly.tar.gz"
  not_if 'modinfo aufs'
end

bash 'extracting linux-aufs_friendly' do
  cwd Chef::Config[:file_cache_path]
  code 'tar -xzf linux-aufs_friendly.tar.gz'
  not_if 'modinfo aufs'
end

bash 'moving core/linux into aufs_friendly build directory' do
  cwd Chef::Config[:file_cache_path]
  code 'mv core/linux linux-aufs_friendly/core-linux; rmdir core'
  not_if 'modinfo aufs'
end

bash 'building linux-aufs_friendly' do
  cwd File.join(Chef::Config[:file_cache_path], 'linux-aufs_friendly')
  code 'makepkg --asroot'
  not_if 'modinfo aufs'
end

bash 'installing linux-aufs_friendly' do
  cwd File.join(Chef::Config[:file_cache_path], 'linux-aufs_friendly')
  code 'pacman --noconfirm --noprogressbar ./linux-aufs_friendly-*.tar.xz'
  not_if 'modinfo aufs'
end

pacman_aur('aufs3'){ action [:build, :install] }

bash 'add the Xen Modules to the mkinitcpio.conf file' do
  code "sed -i 's/MODULES=\"\"/MODULES=\"xen-blkfront xen-fbfront xenfs xen-netfront xen-kbdfront\"/g' /etc/mkinitcpio.conf"
  not_if 'modinfo aufs'
end

bash 'generate GRUB configuration' do
  code 'grub-mkconfig -o /boot/grub/grub.cfg'
  not_if 'modinfo aufs'
end

log 'You need to reboot to complete the linux-aufs_friendly + aufs3 installation.' do
  level :warn
  not_if 'modinfo aufs'
end

log 'If you are running on Linode, you must first change your kernel to pv-grub-x86_64 in the Linode configuration.' do
  level :warn
  not_if 'modinfo aufs'
end
