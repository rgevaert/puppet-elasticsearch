class elasticsearch::config {

 notice("config $elasticsearch::cluster_name")
 notice("config $elasticsearch::cluster_name")


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
