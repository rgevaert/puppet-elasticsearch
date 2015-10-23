class elasticsearch::install {

  ensure_packages('openjdk-7-jre-headless')

  package {
    $elasticsearch::package:
      ensure  => $elasticsearch::package_ensure,
      require => Package['openjdk-7-jre-headless'];
  }

}
