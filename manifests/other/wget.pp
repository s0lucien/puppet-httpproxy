# server/wget.pp
# Manages proxies for the popular wget file downloader
#
# Uses the puppetlabs/inifile module
# https://forge.puppetlabs.com/puppetlabs/inifile
#

class httpproxy::other::wget (
  $ensure = $httpproxy::params::ensure,
  $proxy  = "${httpproxy::params::http_proxy}:${httpproxy::params::http_proxy_port}",
) {

  validate_string($proxy)

  ini_setting { 'wget_proxy' :
    ensure  => $ensure,
    path    => '/etc/yum.conf',
    section => "",
    setting => 'http_proxy',
    value   => $proxy,
  }

}
