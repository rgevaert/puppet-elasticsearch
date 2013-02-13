class elasticsearch::install {

  package {
    $elasticsearch::params::package:
      ensure => installed;
  }

  file {
    '/etc/init.d/elasticsearch':
      ensure   => present,
      source   => 'puppet:///modules/elasticsearch/elasticsearch.init',
      mode     => 755,
      owner    => root,
      group    => root,
  }
}
