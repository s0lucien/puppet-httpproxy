# other/apt.pp
# Manages proxies for the apt package manager

# Uses the puppetlabs/apt module
# https://forge.puppetlabs.com/puppetlabs/apt


# Wrapper class
class httpproxy::other::preseed (
  $ensure = undef,
){
  include httpproxy

  if $httpproxy::preseed { $ensure == absent }
  file { 'apt.conf':
    ensure => $ensure,
    path   => '/etc/apt/',
  }

}
