# pacaur (AUR helper) and its dependencies
include_recipe 'pacman'
package('expac') { action :install }
package('yajl') { action :install }
pacman_aur('cower'){ action [:build, :install] }
pacman_aur('pacaur'){ action [:build, :install] }
