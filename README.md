puppet-qtop
===========

Puppet module for managing qtop: http://fotis.web.cern.ch/fotis/QTOP/

## Usage

    include ::qtop

## Configuring using hiera

    qtop::manage_repo: false

If manage_repo is true, example42/yum is used to manage the yum repository.
