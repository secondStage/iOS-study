#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2015, SecondStage
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
  action :install
end

service "httpd" do
  action [ :enable, :start ]
end

%w{
  /etc/httpd/conf/httpd.conf
  /etc/httpd/conf.d/virtual.conf
  /var/www/html/index.php
}.each do |tmp|
  template tmp do
    owner "root"
    group "root"
    mode 0644
  end
end
