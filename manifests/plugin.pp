# example
#  elasticsearch::plugin {
#    'kopf':
#      install_name => 'lmenezes/elasticsearch-kopf/2.0';
#  }
define elasticsearch::plugin ($install_name) {
  exec {
    $name:
      command  => "/usr/share/elasticsearch/bin/plugin install ${install_name}",
      creates  => "/usr/share/elasticsearch/plugins/${name}";
  }
}
