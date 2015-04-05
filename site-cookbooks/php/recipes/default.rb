#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2015, SecondStage
#
# All rights reserved - Do Not Redistribute
#

packages = %w{
  php
  php-mbstring
  php-pear
}

packages.each do |pkg|
  package pkg do
     action :install
  end
end

template "/etc/php.ini" do
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[httpd]"
end
