default['mysql']['password']   = "vagrant"
default['mysql']['versions']   = "5.6.20-1.el6.x86_64"
default['mysql']['remote_uri'] = "http://dev.mysql.com/get/Downloads/MySQL-5.6/"
default['mysql']['rpm'] = [
  "MySQL-client-5.6.20-1.el6.x86_64.rpm",
  "MySQL-shared-compat-5.6.20-1.el6.x86_64.rpm",
  "MySQL-server-5.6.20-1.el6.x86_64.rpm",
  "MySQL-devel-5.6.20-1.el6.x86_64.rpm",
  "MySQL-shared-5.6.20-1.el6.x86_64.rpm"
]
