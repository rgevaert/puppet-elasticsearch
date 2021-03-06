class elasticsearch::config {

  file {
    $elasticsearch::configdir:
      ensure   => directory;
    $elasticsearch::configfile:
      ensure   => present,
      content  => template($elasticsearch::config_template),
      mode     => '0644',
      owner    => root,
      group    => root;
    '/etc/default/elasticsearch':
      ensure   => present,
      content  => template($elasticsearch::default_template),
      mode     => '0644',
      owner    => root,
      group    => root;
  }

  cron { 'clean-up-es-logs':
    command => 'find /var/log/elasticsearch/ -type f  -mtime +7  -delete',
    user    => root,
    hour    => '6',
  }

}
