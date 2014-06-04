include_recipe 'pacman'
package('perl') { action :install }
package('expac') { action :install }
package('yajl') { action :install }
pacman_aur('cower'){ action [:build, :install] }
pacman_aur('pacaur'){ action [:build, :install] }
