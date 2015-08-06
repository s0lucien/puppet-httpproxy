# Profiled.pp (private class)
# Manages proxies in profile.d
# Uses the unibet/profiled module
# https://forge.puppetlabs.com/unibet/profiled
class httpproxy::profiled {

  # Actual shell script stored in the array $lines.
  $lines = [
    '# Set http proxy for shell',
    "export http_proxy=${httpproxy::proxy_uri}",
    "export https_proxy=${httpproxy::proxy_uri}",
  ]

  # shell paramter enables or disables the shabang at the top of the bash script.
  profiled::script { 'httpproxy.sh':
    ensure  => $httpproxy::ensure,
    content => join($lines, "\n"),
    shell   => 'absent',
  }

}
