[puppet-preseed](https://github.com/stankevich/puppet-preseed)
======

Puppet module for preseeding Debian/Ubuntu package installs with answer files.

## Usage

### preseed

Preseeds Debian/Ubuntu package installs with answer files.

**ensure** — absent/present. Default: present

**source** — Answer file source. Default: debconf.${PACKAGE_NAME}.erb

	preseed { 'libnss-ldapd':
	  ensure => present,
	  source => 'ldap/debconf.libnss-ldapd.erb'
	}

## Authors

[Sergey Stankevich](https://github.com/stankevich)
