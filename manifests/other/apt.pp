# other/apt.pp
# Manages proxies for the apt package manager

# Uses the puppetlabs/apt module
# https://forge.puppetlabs.com/puppetlabs/apt

# Sets the proxy using the apt module with settings defined in init.pp. Then includes parent class.
class ::apt {
  include httpproxy
  proxy_defaults => {
    'host'  => ${httpproxy::http_proxy},
    'port'  => ${httpproxy::http_proxy_port},
    'https' => false,
  }

}
