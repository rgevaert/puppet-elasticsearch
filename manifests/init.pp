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
  $heap_size           = $elasticsearch::params::heap_size,
  $data_dir            = $elasticsearch::params::data_dir,
  $java_opts           = $elasticsearch::params::java_opts,
  $cluster_name        = $elasticsearch::params::cluster_name,
  $node_name           = $elasticsearch::params::node_name,
  $package_ensure      = $elasticsearch::params::package_ensure,
  $package             = $elasticsearch::params::package,
  $service             = $elasticsearch::params::service,
  $configdir           = $elasticsearch::params::configdir,
  $configfile          = $elasticsearch::params::configfile,
  $config_template     = $elasticsearch::params::config_template,
  $default_template    = $elasticsearch::params::default_template,
  $service_name        = $elasticsearch::params::service_name,
  $recover_after_nodes = $elasticsearch::params::recover_after_nodes,
  $recover_after_time  = $elasticsearch::params::recover_after_time,
  $expected_nodes      = $elasticsearch::params::expected_nodes
) inherits elasticsearch::params {

  class{'elasticsearch::install':;} ~>
  class{'elasticsearch::config':;}  ~>
  class{'elasticsearch::service':;}

}
