# init.pp
# Manage http proxies via profiled script

# Defines the httpproxy class. Sets the $http_proxy variable to the $http_proxy
# variable located in the params.pp. Then inherits params attributes.
class httpproxy (
  $http_proxy = "${httpproxy::params::http_proxy}:${httpproxy::params::http_proxy_port}",
) inherits httpproxy::params {

# Uses Selectors, a type of conditional statement to set the ensure parameter.
# If no proxy is provided (undef), ensure will be set to absent.
# Otherwise it will default to placing the file.
  $file_ensure = $http_proxy ? {
    undef   => 'absent',
    default => file,
  }

# Actual shell script stored in the array $lines.
  $lines = [
    '# Set http proxy for shell',
    "export http_proxy=${http_proxy}",
    "export https_proxy=${http_proxy}"
  ]

# Script named httpproxy.sh will be placed in profile.d using unibets module.
# content parameter uses the array $lines, and concatenates the values using a line break
# shell paramter enables or disables the shabang at the top of the bash script.
  profiled::script { 'httpproxy.sh':
    ensure  => $file_ensure,
    content => join($lines, "\n"),
    shell   => 'absent',
  }

}
