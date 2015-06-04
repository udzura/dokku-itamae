# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vbox|
    # Power to the drone
    vbox.customize ["modifyvm", :id, "--memory", 2048]
    vbox.customize ["modifyvm", :id, "--cpus",   4]
  end

  config.vm.define :web do |c|
    c.vm.hostname = 'dokku001.nyah.pbdev'
    c.vm.network "forwarded_port", guest: 80,   host: 8080
    c.vm.network "forwarded_port", guest: 443,  host: 8443
    c.vm.network "forwarded_port", guest: 2375, host: 2375

    # See https://github.com/chiastolite/vagrant-itamae
    # uncomment if you noy use itamae --vagramt
    # c.vm.provision "itamae" do |itamae|
    #   itamae.sudo = true

    #   itamae.recipes = ['./recipe.rb']
    #   itamae.json    = './node.json'
    # end
  end
end
