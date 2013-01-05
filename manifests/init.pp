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
#   include elasticsearch
#
class elasticsearch (
  $package        = $elasticsearch::params::package,
  $version        = $elasticsearch::params::version,
  $service        = $elasticsearch::params::service,
  $config_content = $elasticsearch::params::config_content
  ) inherits elasticsearch::params {

  class{'elasticsearch::install':;} ~>
    class{'elasticsearch::config':;} ~>
    class{'elasticsearch::service':;}
}
