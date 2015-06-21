#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, SecondStage
#
# All rights reserved - Do Not Redistribute
#

package 'mysql-libs' do
  action :remove
end

node['mysql']['rpm'].each do |rpm|
  remote_file "/tmp/#{rpm}" do
    source "#{node['mysql']['remote_uri']}#{rpm}"
  end

  package "#{rpm}" do
    action :install
    source "/tmp/#{rpm}"
  end
end

service "mysql" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start]
end

template "my.cnf" do
  path "/usr/my.cnf"
  source "my.cnf.erb"
  owner "root"
  group "root"
  notifies :restart, "service[mysql]", :delayed
  mode 0644
end

script "Secure_Install" do
  interpreter 'bash'
  user "root"
  not_if "mysql -u root -p #{node['mysql']['password']} -e 'show databases'"
  code <<-EOL
    export Initial_PW=`head -n 1 /root/.mysql_secret |awk '{print $(NF - 0)}'`
    mysql -u root -p${Initial_PW} --connect-expired-password -e "SET PASSWORD FOR root@localhost=PASSWORD('vagrant');"
    mysql -u root -p#{node['mysql']['password']} -e "SET PASSWORD FOR root@'127.0.0.1'=PASSWORD('#{node['mysql']['password']}');"
    mysql -u root -p#{node['mysql']['password']} -e "DELETE FROM mysql.user WHERE User='';"
    mysql -u root -p#{node['mysql']['password']} -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1');"
    mysql -u root -p#{node['mysql']['password']} -e "DROP DATABASE test;"
    mysql -u root -p#{node['mysql']['password']} -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
    mysql -u root -p#{node['mysql']['password']} -e "FLUSH PRIVILEGES;"
  EOL
end

template "total.sql" do
  path "/tmp/total.sql"
  source "total.sql.erb"
  owner "root"
  group "root"
  notifies :restart, "service[mysql]", :delayed
  mode 0644
end

script "Query_Install" do
  interpreter 'bash'
  user "root"
  code <<-EOL
    mysql -u root -p#{node['mysql']['password']} -e "CREATE DATABASE ranking;"
    mysql -u root -p#{node['mysql']['password']} ranking < /tmp/total.sql
  EOL
end
