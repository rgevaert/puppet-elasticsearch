# Class: elasticsearch
#
# This module manages elasticsearch
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class elasticsearch (
  $package_ensure     = $elasticsearch::params::package_ensure,
  $package            = $elasticsearch::params::package,
  $service            = $elasticsearch::params::service,
  $configdir          = $elasticsearch::params::configdir,
  $configfile         = $elasticsearch::params::configfile,
  $configfile_content = $elasticsearch::params::configfile_content,
  $service_name       = $elasticsearch::params::service_name
) inherits elasticsearch::params {

  class{'elasticsearch::install':} ~>
  class{'elasticsearch::config':}  ->
  class{'elasticsearch::service':}

}
