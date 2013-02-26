class elasticsearch::params {

  $cluster_name       = ''
  $node_name          = $::hostname
  $package            = 'elasticsearch'
  $package_ensure     = 'installed'
  $service            = 'elasticsearch'
  $configdir          = '/etc/elasticsearch'
  $configfile         = "${configdir}/elasticsearch.yml"
  $config_template    = 'elasticsearch/elasticsearch.yml.erb'
  $service_name       = 'elasticsearch'

}
