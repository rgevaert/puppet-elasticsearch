class elasticsearch::params {

  $package            = 'elasticsearch'
  $package_ensure     = 'installed'
  $service            = 'elasticsearch'
  $configdir          = '/etc/elasticsearch'
  $configfile         = "${configdir}/elasticsearch.yml"
  $configfile_content = template('elasticsearch/elasticsearch.yml.erb')
  $service_name       = 'elasticsearch'

}
