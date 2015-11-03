# Class: elasticsearch
#
# major_release is like '1.7'
#
class elasticsearch (
  $major_release,
  $heap_size           = $elasticsearch::params::heap_size,
  $data_dir            = $elasticsearch::params::data_dir,
  $java_opts           = $elasticsearch::params::java_opts,
  $cluster_name        = $elasticsearch::params::cluster_name,
  $network_host        = $elasticsearch::params::network_host,
  $node_name           = $elasticsearch::params::node_name,
  $package_ensure      = $elasticsearch::params::package_ensure,
  $package             = $elasticsearch::params::package,
  $service             = $elasticsearch::params::service,
  $configdir           = $elasticsearch::params::configdir,
  $configfile          = $elasticsearch::params::configfile,
  $config_template     = $elasticsearch::params::config_template,
  $default_template    = $elasticsearch::params::default_template,
  $service_name        = $elasticsearch::params::service_name,
  $recover_after_nodes = $elasticsearch::params::recover_after_nodes,
  $recover_after_time  = $elasticsearch::params::recover_after_time,
  $expected_nodes      = $elasticsearch::params::expected_nodes,
  $index_number_of_shards = $elasticsearch::params::index_number_of_shards,
  $index_number_of_replicas = $elasticsearch::params::index_index_number_of_replicas,
  $config              = $elasticsearch::params::config
) inherits elasticsearch::params {

  if($major_release != ''){
    class{
      'elasticsearch::repo':
        notify => Class['elasticsearch::install'],
        before => Class['elasticsearch::install'];
    }
  }

  class{'elasticsearch::install':;} ~>
  class{'elasticsearch::config':;}  ~>
  class{'elasticsearch::service':;}

}
