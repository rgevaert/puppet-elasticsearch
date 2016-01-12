define elasticsearch::plugin {
  exec {
    $name:
      cwd     => '/usr/share',
      command => "elasticsearch/bin/plugin install install ${name}";
  }
}
