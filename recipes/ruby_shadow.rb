include_recipe 'pacman'
pacman_aur('ruby-shadow'){ action [:build, :install] }
