exec { 'apt_update':
  command => 'apt-get update',
  path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin']
}

package {'python-software-properties':
  require => Exec['apt_update']
}

exec { 'add_repo':
  command => 'add-apt-repository ppa:ondrej/php5-oldstable',
  path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  require => Package['python-software-properties']
}

exec { 'update_repo' :  
  command => 'apt-get update',
  path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  require => Exec['add_repo']
} 


class { 'nodejs::install': }
class { 'webtools::install': }
class { 'composer::install': }
class { 'git::install': }
class { 'apache2::install': }
class { 'php5::install': }
class { 'mysql::install': }
class { 'wordpress::install': }
class { 'phpmyadmin::install': }
class { 'phpqa::install': }
class { 'roots::install': }
class { 'grunt::install': }

# class { 'subversion::install': }