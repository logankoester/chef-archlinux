node['archlinux']['packages']['remove'].each do |pkg|
  package(pkg) { action :remove }
end

node['archlinux']['packages']['install'].each do |pkg|
  package(pkg) { action :install }
end
