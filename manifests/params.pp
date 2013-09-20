class elasticsearch::params {

  $cluster_name       = ''
  $node_name          = $::hostname
  $package            = 'elasticsearch'
  $package_ensure     = 'installed'
  $service            = 'elasticsearch'
  $configdir          = '/etc/elasticsearch'
  $configfile         = "${configdir}/elasticsearch.yml"
  $config_template    = 'elasticsearch/elasticsearch.yml.erb'
  $default_template   = 'elasticsearch/default.erb'
  $service_name       = 'elasticsearch'

  # elasticsearch specific parameters
  $recover_after_nodes= 1
  $recover_after_time = '5m'
  $expected_nodes     = 2

  # Default file params
  $heap_size          = '2G'
  $data_dir           = '/var/lib/elasticsearch'
  $java_opts          = ''
}
