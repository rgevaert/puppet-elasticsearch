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
  $cluster_name        = $elasticsearch::params::cluster_name,
  $node_name           = $elasticsearch::params::node_name,
  $package_ensure      = $elasticsearch::params::package_ensure,
  $package             = $elasticsearch::params::package,
  $service             = $elasticsearch::params::service,
  $configdir           = $elasticsearch::params::configdir,
  $configfile          = $elasticsearch::params::configfile,
  $config_template     = $elasticsearch::params::config_template,
  $service_name        = $elasticsearch::params::service_name
) inherits elasticsearch::params {

  class{'elasticsearch::install':;} ~>
  class{'elasticsearch::config':;}  ->
  class{'elasticsearch::service':;}

}
