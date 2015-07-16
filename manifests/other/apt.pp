# server/apt.pp
# Manages proxies for the apt package manager
#
# Uses the puppetlabs/apt module
# https://forge.puppetlabs.com/puppetlabs/apt
#

class ::apt {
  proxy_defaults => {
    'host'  => ${httpproxy::params::http_proxy},
    'port'  => ${httpproxy::params::http_proxy_port},
    'https' => false,
  }

}
