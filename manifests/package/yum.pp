# other/yum.pp
# Manages proxies for the yum package manager

# Uses the puppetlabs/inifile module
# https://forge.puppetlabs.com/puppetlabs/inifile

# Creates a wrapper class to use the ini resource and includes parent class.
class httpproxy::package::yum {
  include ::httpproxy

  # Writes ini settings defined in init.pp in the yum configuration file.
  ini_setting { 'yum_proxy':
    ensure  => $httpproxy::ensure,
    path    => '/etc/yum.conf',
    section => 'main',
    setting => 'proxy',
    value   => $httpproxy::proxy_uri,
  }

}
