#
# Cookbook Name:: php
# Recipe:: composer
#
# Copyright 2015, SecondStage
#
# All rights reserved - Do Not Redistribute
#

script "Composer_Install" do
  interpreter 'bash'
  user "root"
  code <<-EOL
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
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