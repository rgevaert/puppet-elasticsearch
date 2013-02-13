class elasticsearch::config {

  file {
    $elasticsearch::params::configdir:
      ensure   => directory;
    $elasticsearch::params::configfile:
      ensure   => present,
      source   => 'puppet:///modules/elasticsearch/elasticsearch.yml',
      mode     => 755,
      owner    => root,
      group    => root,
      notify   => Class['elasticsearch::service'];
  }
}
