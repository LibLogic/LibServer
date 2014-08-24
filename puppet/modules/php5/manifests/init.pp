# Install PHP


class php5::install {


	package { 'php5' :
          ensure => 'latest'
        }

	package { [
	  'php-apc',
	  'php5-cli',
	  'php5-common',
	  'php5-curl',
	  'php5-dev',
	  'php5-fpm',
	  'php5-gd',
	  'php5-imagick',
	  'php5-imap',
	  'libapache2-mod-php5',
	  'php5-mcrypt',
	  'php5-memcache',
	  'php5-memcached',
	  'php5-mysql',
	  'php-pear',
	  'php5-pgsql',
	  'php5-sqlite',
	  'php5-xdebug'
	]:
	ensure => present,
	require => [Package['php5']]
	}

  
	# upgrade pear
	exec {"pear upgrade":
	  command => "/usr/bin/pear upgrade",
	  require => Package['php-pear'],
	}
	
	# set channels to auto discover
	exec { "pear auto_discover" :
		command => "/usr/bin/pear config-set auto_discover 1",
		require => [Package['php-pear']]
	}
	
	# update channels
	exec { "pear update-channels" :
		command => "/usr/bin/pear update-channels",
		require => [Package['php-pear']]
	}
}
