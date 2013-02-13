class elasticsearch::install {

  package {
    $elasticsearch::package:
      ensure => $elasticsearch::package_ensure;
  }

}
