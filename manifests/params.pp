class elasticsearch::params {

  $version        = 'present'

  $package        = 'elasticsearch'
  $service        = 'elasticsearch'
  $config_content = 'elasticsearch/elasticsearch.yml.erb'
  $service_name   = 'elasticsearch'

}
