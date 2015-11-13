# == Class: qtop
#
# Install qtop.
#
# http://fotis.web.cern.ch/fotis/QTOP/
#
# === Parameters
#
# Document parameters here.
#
# [*parameter1*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Examples
#
#  include '::qtop'
#
# Configuration is done using Hiera.
#
# === Authors
#
# Baptiste Grenier <bgrenier@gnubila.fr>
#
# === Copyright
#
# Copyright 2015 gnúbila
#
class qtop (
  $manage_repo = true,
  package_ensure = 'installed',
) {
  validate_bool($manage_repo)
  validate_string($package_ensure)

  if $manage_repo {
    yum::managed_yumrepo { 'home_georgatos':
      descr    => "qtop project is mainly involved in building cluster monitoring tools (RedHat_RHEL-${::lsbmajdistrelease})",
      baseurl  => "http://download.opensuse.org/repositories/home:/georgatos/RedHat_RHEL-${::lsbmajdistrelease}/",
      enabled  => 1,
      priority => 10,
      gpgcheck => 1,
      gpgkey   => "http://download.opensuse.org/repositories/home:/georgatos/RedHat_RHEL-${::lsbmajdistrelease}/repodata/repomd.xml.key",
    }
  }

  package { 'qtop':
    ensure => $package_ensure,
  }
}

# vim: set et sta sw=2 ts=2 sts=2 noci noai:
