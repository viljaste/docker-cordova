class build::android::sdk::packages {
  require build::java

  package {[
      'lib32stdc++6',
      'lib32z1'
    ]:
    ensure => present,
    before => Bash_exec['( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /usr/local/src/android-sdk-linux/tools/android update sdk --no-ui -a --filter tools,platform-tool,build-tools-22.0.1,android-22,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services']
  }

  file { '/tmp/android-sdk_r24.2-linux':
    ensure => directory,
    recurse => true,
    force => true,
    source => 'puppet:///modules/build/tmp/android-sdk_r24.2-linux',
  }

  bash_exec { 'cat /tmp/android-sdk_r24.2-linux/android-sdk_r24.2-linux.tgz.gz.* | gunzip > /tmp/android-sdk_r24.2-linux.tgz':
    require => File['/tmp/android-sdk_r24.2-linux']
  }

  bash_exec { 'tar xzf /tmp/android-sdk_r24.2-linux.tgz -C /usr/local/src':
    require => Bash_exec ['cat /tmp/android-sdk_r24.2-linux/android-sdk_r24.2-linux.tgz.gz.* | gunzip > /tmp/android-sdk_r24.2-linux.tgz']
  }

  file { '/etc/profile.d/android.sh':
    ensure => present,
    source => 'puppet:///modules/build/etc/profile.d/android.sh',
    mode => 755,
    require => Bash_exec['tar xzf /tmp/android-sdk_r24.2-linux.tgz -C /usr/local/src']
  }

  bash_exec { '( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /usr/local/src/android-sdk-linux/tools/android update sdk --no-ui -a --filter tools,platform-tool,build-tools-22.0.1,android-22,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services':
    require => File['/etc/profile.d/android.sh']
  }
}
