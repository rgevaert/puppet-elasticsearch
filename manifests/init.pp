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
class elasticsearch {

  include elasticsearch::params
  include elasticsearch::install
  include elasticsearch::config
  include elasticsearch::service

  Class['elasticsearch::params'] ->
  Class['elasticsearch::install'] ->
  Class['elasticsearch::config'] ->
  Class['elasticsearch::service']
}
