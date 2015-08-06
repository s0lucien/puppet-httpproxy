# Packagemanager.pp (private class)
# This class chooses the appropriate package handler class based on OS distribution
class httpproxy::other::packagemanager {

  case $::osfamily {
    'RedHat': {
      contain '::httpproxy::other::yum'
    }
    'Debian': {
      contain '::httpproxy::other::apt'
      if $httpproxy::purge_apt_conf { contain '::httpproxy::other::purge_apt_conf' }
    }
    default: {fail ('your distro is not supported')}
  }

}
