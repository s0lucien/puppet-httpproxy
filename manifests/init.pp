# init.pp
# Manages http proxies

# Defines the httpproxy class. Sets the $http_proxy and $http_proxy_port variable to null.
class httpproxy (
  $http_proxy = undef,
  $http_proxy_port = undef
) inherits httpproxy::params {

# Validates that $http_proxy and $http_proxy_port are domain names and ports respectively.
  if $http_proxy { validate_re($http_proxy, '^([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$') }
  if $http_proxy_port { validate_re($http_proxy_port, '^\d+$') }

# Checks if $http_proxy contains a string. If $http_proxy is null $ensure is set to absent.
# If $http_proxy contains a string then $ensure is set to present.
  $ensure = $http_proxy ? {
    undef   => 'absent',
    default => 'present'
  }

# Checks if $http_proxy_port contains a string. If $http_proxy_port is null, $proxy_port_string
# is set to null. Otherwise, a colon is added in front of $http_proxy_port and stored in
# $proxy_port_string
  $proxy_port_string = $http_proxy_port ? {
    undef   => undef,
    default => ":${http_proxy_port}"
  }

  # Checks if $http_proxy contains a string. If it is null, $proxy_uri is set to null.
  # Otherwise, it will concatenate $http_proxy and $proxy_port_string.
  $proxy_uri = $http_proxy ? {
    undef   => undef,
    default => "http://${http_proxy}${proxy_port_string}"
  }

}
