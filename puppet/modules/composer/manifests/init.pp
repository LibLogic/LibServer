# install composer

class composer::install {

   exec { 'composer-install' :
    command =>'curl -sS https://getcomposer.org/installer | php',
    path => ['/bin', '/usr/bin'],
    require => Package['curl'],
  }

  exec { 'comp-global' :
    command =>'mv composer.phar /usr/local/bin/composer',
    path => ['/bin', '/usr/bin'],
    require => Exec['composer-install'],
  }

}