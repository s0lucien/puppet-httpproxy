# Packagemanager.pp (private class)
# This class chooses the appropriate package handler class based on OS distribution
class httpproxy::packagemanager {

  case $::osfamily {
    'RedHat': {
      contain ::httpproxy::package::yum
    }
    'Debian': {
      contain ::httpproxy::package::apt
      if $httpproxy::purge_apt_conf { contain ::httpproxy::package::purge_apt_conf }
    }
    default: {fail ('your distro is not supported')}
  }

}
