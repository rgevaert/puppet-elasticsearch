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
  }
}
