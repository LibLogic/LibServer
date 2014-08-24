class roots::install {

  exec {'roots-install' :
    command => 'git clone https://github.com/roots/roots.git roots',
    path => ['/bin', '/usr/bin'],
    cwd => '/vagrant/wp/wp-content/themes/',
    require => [Package['git'], Exec['wordpress-install']]
  }

}