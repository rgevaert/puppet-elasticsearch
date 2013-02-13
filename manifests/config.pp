class elasticsearch::config {

  file {
    $elasticsearch::configdir:
      ensure   => directory;
    $elasticsearch::configfile:
      ensure   => present,
      content  => $elasticsearch::configfile_content,
      mode     => '0644',
      owner    => root,
      group    => root;
  }
}
