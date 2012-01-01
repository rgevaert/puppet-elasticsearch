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

  package {
    'elasticsearch':
      ensure => installed;
  }

  file {
    '/etc/init.d/elasticsearch':
      ensure   => present,
      source   => 'puppet:///modules/elasticsearch/elasticsearch.init',
      mode     => 755,
      owner    => root,
      group    => root,
      require => Package['elasticsearch'];
    '/etc/elasticsearch':
      ensure   => directory;
    '/etc/elasticsearch/elasticsearch.yml':
      ensure   => present,
      source   => 'puppet:///modules/elasticsearch/elasticsearch.yml',
      mode     => 755,
      owner    => root,
      group    => root,
      require => Package['elasticsearch'];
  }

  service {
    'elasticsearch':
      enable    => true,
      ensure    => running,
      pattern   => '/opt/elasticsearch',
      hasstatus => false,
      require   => [File['/etc/init.d/elasticsearch'],File['/etc/elasticsearch/elasticsearch.yml']];
  }
}
