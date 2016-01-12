define elasticsearch::plugin {
  exec {
    $name:
      provider => 'shell',
      cwd      => '/usr/share',
      command  => "elasticsearch/bin/plugin install install ${name}";
  }
}
