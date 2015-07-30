# other/profiled.pp
# Manages proxies in profile.d
# Uses the unibet/profiled module
# https://forge.puppetlabs.com/unibet/profiled

# Creats a wrapper class and includes the parent class
class httpproxy::other::profiled {
  include ::httpproxy

  # Actual shell script stored in the array $lines.
  $lines = [
    '# Set http proxy for shell',
    "export http_proxy=${httpproxy::proxy_uri}",
    "export https_proxy=${httpproxy::proxy_uri}",
  ]

  # Script named httpproxy.sh will be placed in profile.d using unibets module.
  # content parameter uses the array $lines, and concatenates the values using a line break
  # shell paramter enables or disables the shabang at the top of the bash script.
  ::profiled::script { 'httpproxy.sh':
    ensure  => $httpproxy::ensure,
    content => join($lines, "\n"),
    shell   => 'absent',
  }

}
