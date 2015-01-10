include_recipe 'pacman'
package('perl') { action :install }
package('expac') { action :install }
package('yajl') { action :install }

bash 'Importing key for cower' do
  code <<-EOH
    pacman-key --recv-key 1EB2638FF56C0C53
    pacman-key --lsign 1EB2638FF56C0C53
  EOH
end

pacman_aur('cower'){ action [:build, :install] }
pacman_aur('pacaur'){ action [:build, :install] }
