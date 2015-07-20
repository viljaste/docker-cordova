class build::consul {
  require build::consul::packages
  require build::consul::supervisor

  bash_exec { 'mkdir -p /etc/consul/consul.d': }

  file { '/etc/consul/consul.json':
    ensure => present,
    source => 'puppet:///modules/build/etc/consul/consul.json',
    mode => 644,
    require => Bash_exec['mkdir -p /etc/consul/consul.d']
  }
}
