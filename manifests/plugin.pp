define elasticsearch::plugin {
  exec {
    $name:
      command  => "/usr/share/elasticsearch/bin/plugin install ${name}";
  }
}
