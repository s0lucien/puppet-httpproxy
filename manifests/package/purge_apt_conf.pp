# other/purge_apt_conf.pp
# Purges apt.conf
# private class

# Wrapper class
class httpproxy::package::purge_apt_conf {

  file { '/etc/apt/apt.conf':
    ensure => absent,
  }

}
