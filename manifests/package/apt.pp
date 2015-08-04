# other/apt.pp
# Manages proxies for the apt package manager

# Uses the puppetlabs/apt module
# https://forge.puppetlabs.com/puppetlabs/apt


# Wrapper class
class httpproxy::package::apt {
  include ::httpproxy
  include ::apt

  if $httpproxy::ensure == present { $ensure = file }
  else { $ensure = absent }
  # Sets the proxy using the apt module with settings defined in init.pp. Then includes parent class.
  apt::setting { 'conf-proxy':
    ensure   => $ensure,
    priority => '01',
    content  => "Acquire::http::Proxy \"${httpproxy::proxy_uri}\";",
  }

}
