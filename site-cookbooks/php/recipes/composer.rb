#
# Cookbook Name:: php
# Recipe:: composer
#
# Copyright 2015, SecondStage
#
# All rights reserved - Do Not Redistribute
#

script "epel_Install" do
  interpreter 'bash'
  user "root"
  code <<-EOL
    wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    rpm -Uvh epel-release-6-8.noarch.rpm
  EOL
end

script "remi_Install" do
  interpreter 'bash'
  user "root"
  code <<-EOL
  wget ​http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
  rpm -Uvh remi-release-6.rpm
  EOL
end

script "Composer_Install" do
  interpreter 'bash'
  user "root"
  code <<-EOL
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
    composer self-update
  EOL
end

script "Larabel_Install" do
  interpreter 'bash'
  user "root"
  code <<-EOL
    composer global require "laravel/installer=~1.1"
    export PATH=$PATH:~/.composer/vendor/bin
    service httpd restart
  EOL
end
