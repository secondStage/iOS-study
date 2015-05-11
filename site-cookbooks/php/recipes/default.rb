#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2015, SecondStage
#
# All rights reserved - Do Not Redistribute
#

#php-Monolog
#php-jsonlint
#php-mysqlnd
#php-opcache
#hp-pecl-mongo
#php-pecl-apc
#php-pecl-apc-devel
#php-redis
#php-mcrypt

packages = %w{
  ImageMagick
  ImageMagick-devel
  libjpeg-devel
  libpng-devel
  php-cli
  php-pdo
  php-mysql
  php-common
  php
  php-cgi
  php-fpm
  php-devel
  php-mbstring
  php-odbc
  php-pear
  php-snmp
  php-bcmath
  php-xmlrpc
  php-tidy
  php-xml
  php-soap
  php-pgsql
  php-xml
  php-dba
  php-imap
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
