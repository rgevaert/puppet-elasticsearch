class elasticsearch::params {

  $package           = 'elasticsearch'
  $package_ensure    = 'installed'
  $service           = 'elasticsearch'
  $configdir         = '/etc/elasticsearch'
  $configfile        = "${configdir}/elasticsearch.yml"
  $configfile_source = template('elasticsearch/elasticsearch.yml.erb')
  $service_name      = 'elasticsearch'

}
