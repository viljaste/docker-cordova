class build::consul::supervisor {
  file { '/etc/supervisor/conf.d/consul.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/consul.conf',
    mode => 644
  }
}
