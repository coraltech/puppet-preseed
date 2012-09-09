preseed { 'libnss-ldapd':
  ensure => present,
  source => 'ldap/debconf.libnss-ldapd.erb'
}
