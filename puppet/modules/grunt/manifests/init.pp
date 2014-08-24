 class grunt::install {

  exec { 'grunt-cli-install' :
    command => 'npm install -g grunt-cli',
    path => ['/bin', '/usr/bin','/usr/local/bin'],
    require => [Package['nodejs'], Exec['roots-install']],
  }

  exec { 'npm-install-modules' :
    command => 'npm install --no-bin-links',
    cwd => '/vagrant/wp/wp-content/themes/roots',
    timeout => 1800,
    path => ['/bin', '/usr/bin','/usr/local/bin'],
    require => [Exec['grunt-cli-install'], Package['nodejs'], Exec['roots-install']],
  }

}