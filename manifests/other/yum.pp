# server/yum.pp
# Manages proxies for the yum package manager
#
# Uses the puppetlabs/inifile module
# https://forge.puppetlabs.com/puppetlabs/inifile
#

class httpproxy::other::yum (
  $ensure = $httpproxy::params::ensure,
  $proxy  = "${httpproxy::params::http_proxy}:${httpproxy::params::http_proxy_port}",
) {

  validate_string($proxy)

  ini_setting { 'yum_proxy' :
    ensure  => $ensure,
    path    => '/etc/yum.conf',
    section => 'main',
    setting => 'proxy',
    value   => $proxy,
  }

}
