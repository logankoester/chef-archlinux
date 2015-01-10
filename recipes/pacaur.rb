include_recipe 'pacman'
package('perl') { action :install }
package('expac') { action :install }
package('yajl') { action :install }

pacman_aur 'cower' do
  skippgpcheck true
  action [:build, :install]
end

pacman_aur('pacaur'){ action [:build, :install] }
