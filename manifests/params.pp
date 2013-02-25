class elasticsearch::params {

  # No clustername set by default
  $cluster_name      = ''
  $node_name         = $::hostname

  $package           = 'elasticsearch'
  $package_ensure    = 'installed'
  $service           = 'elasticsearch'
  $configdir         = '/etc/elasticsearch'
  $configfile        = "${configdir}/elasticsearch.yml"
  $configfile_source = template('elasticsearch/elasticsearch.yml.erb')
  $service_name      = 'elasticsearch'

}
