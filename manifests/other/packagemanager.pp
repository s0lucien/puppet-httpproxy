# This class chooses the appropriate package handler class based on OS distribution
class httpproxy::other::packagemanager {

  case $::osfamily {
    'RedHat': {
      contain '::httpproxy::other::yum'
    }
    'Debian': {
      contain '::httpproxy::other::apt'
    }
    default: {fail ('your distro is not supported')}
  }

}
