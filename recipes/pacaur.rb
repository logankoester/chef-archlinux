include_recipe 'pacman'
package('perl') { action :install }
package('expac') { action :install }
package('yajl') { action :install }
package('git') { action :install }

ENV['PATH'] = "#{ENV['PATH']}:/usr/bin/core_perl"

pacman_aur 'cower' do
  skippgpcheck true
  action [:build, :install]
end

pacman_aur('pacaur'){ action [:build, :install] }
