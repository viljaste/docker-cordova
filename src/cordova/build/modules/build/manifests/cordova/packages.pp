class build::consul::packages {
  file { '/tmp/0.5.2_linux_amd64.zip':
    ensure => present,
    source => 'puppet:///modules/build/tmp/0.5.2_linux_amd64.zip'
  }

  bash_exec { 'cd /tmp && unzip 0.5.2_linux_amd64.zip':
    require => File['/tmp/0.5.2_linux_amd64.zip']
  }

  bash_exec { 'mv /tmp/consul /usr/local/bin/consul':
    require => Bash_exec['cd /tmp && unzip 0.5.2_linux_amd64.zip']
  }
}
