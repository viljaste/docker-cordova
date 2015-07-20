class build::cordova::packages {
  require build::nodejs

  file { '/usr/bin/node':
    ensure => link,
    target => '/usr/bin/nodejs',
    mode => 755
  }

  bash_exec { 'npm install -g cordova':
    require => File['/usr/bin/node']
  }
}
