# other/wget.pp
# Manages proxies for the popular wget file downloader

# Uses the puppetlabs/inifile module
# https://forge.puppetlabs.com/puppetlabs/inifile

# Creates a wrapper class to use the ini resource and includes parent class.
class httpproxy::other::wget {
  include ::httpproxy

  # Writes ini settings defined in init.pp in the wget configuration file.
  ini_setting { 'wget-http_proxy':
    ensure  => $httpproxy::ensure,
    path    => '/etc/wgetrc',
    section => '',
    setting => 'http_proxy',
    value   => $httpproxy::proxy_uri,
  }
  ini_setting { 'wget-https_proxy':
    ensure  => $httpproxy::ensure,
    path    => '/etc/wgetrc',
    section => '',
    setting => 'https_proxy',
    value   => $httpproxy::proxy_uri,
  }
}
