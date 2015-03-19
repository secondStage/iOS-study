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

