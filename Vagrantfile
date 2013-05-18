# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'berkshelf/vagrant'

Vagrant.configure('2') do |config|
  config.vm.box = 'archlinux'
  config.vm.box_url = '../../boxes/archlinux.box'

  config.ssh.default.username = 'gibson'
  config.ssh.max_tries = 40
  config.ssh.timeout   = 120
  config.ssh.private_key_path = '~/keys/gibson-id_rsa'

  config.berkshelf.berksfile_path = './Berksfile'
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.data_bags_path = '../../data'

    chef.json = {}

    chef.run_list = [
        'recipe[archlinux::default]'
    ]
  end
end
