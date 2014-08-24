# Install nodejs

class nodejs::install {


  exec {'add-repo' :
    command => 'add-apt-repository ppa:chris-lea/node.js', 
    path    => ['/bin', '/usr/bin'],    
    require => Package['python-software-properties'],
  }

  exec { 'new-repo':
    command => 'apt-get update',
    path    => ['/bin', '/usr/bin'],
    require => Exec['add-repo']  
  }

  package {'nodejs':
    require => Exec['new-repo'],
  }

  exec {'update-npm' :
    command => 'npm update npm -g',
    path    => ['/bin', '/usr/bin'],   
    require => Package['nodejs'],
    }

}
