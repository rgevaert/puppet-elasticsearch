class elasticsearch::service {

  service {
    $elasticsearch::params::service_name:
      enable    => true,
      ensure    => running,
      pattern   => "${elasticsearch::params::service_pattern}",
      hasstatus => false;
  }

}
