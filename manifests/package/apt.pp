# package/apt.pp (private class)
# Uses the puppetlabs-apt module to manage apt package manager proxies
# https://forge.puppetlabs.com/puppetlabs/apt
class httpproxy::package::apt {

  class { '::apt':
    proxy => {
      'ensure' => $httpproxy::ensure,
      'host'   => $httpproxy::http_proxy,
      'port'   => $httpproxy::http_proxy_port,
    },
  }
  contain ::apt

}
