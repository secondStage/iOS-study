#
# Cookbook Name:: mysql
# Recipe:: database
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe "database::mysql"

mysql_connection_info = {:host => "localhost",
                         :username => "root",
                         :password => "root"}

mysql_database "study" do
  connection mysql_connection_info
  action :create
end

mysql_database_user "admin" do
  connection mysql_connection_info
  password "admin"
  database_name "study"
  privileges [:all]
  action [:create, :grant]
end

mysql_database_user "vagrant" do
  connection mysql_connection_info
  password "vagrant"
  database_name "study"
  privileges [:select, :update, :insert, :delete]
  action [:create, :grant]
end
