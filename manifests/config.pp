class elasticsearch::config {

  file {
    '/etc/elasticsearch/elasticsearch.yml':
      ensure   => present,
      content  => template($elasticsearch::config_content),
      mode     => '0755',
      owner    => root,
      group    => root,
  }
}
