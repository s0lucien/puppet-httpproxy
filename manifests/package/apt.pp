# package/apt.pp (private class)
# Uses the puppetlabs-apt module to manage apt package manager proxies
# https://forge.puppetlabs.com/puppetlabs/apt
class httpproxy::package::apt {

  if $httpproxy::ensure == present { $ensure = file }
  else { $ensure = absent }

  class { 'apt':
    proxy {
      ensure => $ensure
      host => $httpproxy::http_proxy,
      port => $httpproxy::http_proxy_port,
    }
}
