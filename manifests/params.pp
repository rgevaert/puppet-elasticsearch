class elasticsearch::params {

  $package    = "elasticsearch"
  $service    = "elasticsearch"
  $configdir  = "/etc/elasticsearch"
  $configfile = "${configdir}/elasticsearch.yml"
  $service_name
              = "elasticsearch"
  $service_pattern
              = "/opt/elasticsearch"

}
