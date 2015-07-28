# other/apt.pp
# Manages proxies for the apt package manager

# Uses the puppetlabs/apt module
# https://forge.puppetlabs.com/puppetlabs/apt


# Wrapper class
class httpproxy::other::apt {
  include httpproxy

  # Sets the proxy using the apt module with settings defined in init.pp. Then includes parent class.
  class { '::apt':
    proxy_defaults => {
      'host'  => $httpproxy::http_proxy,
      'port'  => $httpproxy::http_proxy_port,
      'https' => false
    }
  }
  contain '::apt'

}
