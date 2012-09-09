# == Define: preseed
#
# Preseeds Debian/Ubuntu package installs with answer files.
#
# === Parameters
#
# [*ensure*]
#  present / absent. Default: present
#
# [*source*]
#  Answer file source. Default: debconf.PACKAGE.erb
#
# === Examples
#
# preseed { 'libnss-ldapd':
#   ensure => present,
#   source => 'ldap/debconf.libnss-ldapd.erb'
# }
#
# === Authors
#
# Sergey Stankevich
#
define preseed (
  $ensure = present,
  $source = false
) {

  $real_source = $source ? {
    false   => "${name}/debconf.${name}.erb",
    default => $source,
  }

  file { "/var/local/debconf.${name}":
    mode    => '0600',
    content => template($real_source),
    backup  => false,
  }

  package { $name:
    ensure       => $ensure,
    responsefile => "/var/local/debconf.${name}",
    require      => File["/var/local/debconf.${name}"],
  }

}
