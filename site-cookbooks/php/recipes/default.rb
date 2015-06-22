#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2015, SecondStage
#
# All rights reserved - Do Not Redistribute
#

# add epel repo
remote_file "/tmp/#{node['php']['epel_rpm']}" do
  source "#{node['php']['epel_remote_uri']}#{node['php']['epel_rpm']}"
end

package "#{node['php']['epel_rpm']}" do
  action :install
  source "/tmp/#{node['php']['epel_rpm']}"
end

# add remi-php56 repo
yum_repository 'remi-php56' do
  description 'Les RPM de Remi php56 - Repository'
  baseurl 'http://rpms.famillecollet.com/enterprise/6.6/php56/x86_64/'
  gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  fastestmirror_enabled true
  action :create
end

#php.ini設定
template "php.ini" do
  path "/etc/php.ini"
  source "php.ini.erb"
  mode 0644
  action :nothing
end

#php導入
package "php" do
  action :install
  #options "--enablerepo=remi"
end


# 関連パッケージのインストール

#php-Monolog
#php-jsonlint
#php-mysqlnd
#php-opcache
#hp-pecl-mongo
#php-pecl-apc
#php-pecl-apc-devel
#php-redis

packages = %w{
  ImageMagick
  ImageMagick-devel
  libjpeg-devel
  libpng-devel
  php-cli
  php-pdo
  php-mysql
  php-common
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

# php-mcryptパッケージのインストール
package "php-mcrypt" do
  action :install
  #options "--enablerepo=epel,remi,rpmforge"
end

