class elasticsearch::service {

  service {
    $elasticsearch::service_name:
      ensure    => running,
  }

}
