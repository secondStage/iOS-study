#
# Cookbook Name:: mysql
# Recipe:: database
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


#%w(
#  resource_mysql_database.rb
#  resource_mysql_database_user.rb
#  resource_mysql2_chef_gem.rb
#).each do |resource|
#  require File.join(File.dirname(__FILE__) + '/../libraries/', resource)
#end

#mysql2_chef_gem 'default' do
#  gem_version '0.3.17'
#  provider Chef::Provider::Mysql2ChefGem::Mysql
#  action :install
#end

mysql_connection_info = {:host => "localhost",
                         :username => "root",
                         :password => ""}

#database "study" do
#  connection mysql_connection_info
#  provider   Chef::Provider::Database::Mysql
#  action :create
#end

#mysql_database_user "admin" do
#  connection mysql_connection_info
#  password "admin"
#  database_name "study"
#  privileges [:all]
#  action [:create, :grant]
#end

#mysql_database_user "vagrant" do
#  connection mysql_connection_info
#  password "vagrant"
#  database_name "study"
#  privileges [:select, :update, :insert, :delete]
#  action [:create, :grant]
#end
