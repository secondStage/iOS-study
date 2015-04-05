#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, SecondStage
#
# All rights reserved - Do Not Redistribute
#
package "mysql-server" do
  action :install
end

service "mysqld" do
  action [ :enable, :start ]
end

template "my.cnf" do
  path "/etc/my.cnf"
  source "my.cnf.erb"
  owner "root"
  group "root"
  mode 0644
end
