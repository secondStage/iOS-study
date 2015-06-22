# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "chef/centos-6.5"

  # Omnibus
  config.omnibus.chef_version = :latest

  # Chef
  config.vm.provision "chef_zero" do |chef|
    chef.custom_config_path = "Vagrantfile.chef"
    chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
    chef.add_recipe "apache"
    chef.add_recipe "mysql"
    #chef.add_recipe "mysql::database"
    chef.add_recipe "php"
    chef.add_recipe "php::composer"
    chef.add_recipe "yum"
    chef.add_recipe "yum-epel"
    #chef.add_recipe "yum-mysql-community"
  end

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.55.10"
end
