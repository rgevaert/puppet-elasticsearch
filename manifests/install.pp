class elasticsearch::install {

  package {
    'openjdk-7-jre-headless':
      ensure => present;
    $elasticsearch::package:
      ensure  => $elasticsearch::package_ensure,
      require => Package['openjdk-7-jre-headless'];
  }

}
