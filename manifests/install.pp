class elasticsearch::install {

  package {
    $elasticsearch::package:
      ensure => $elasticsearch::version;
  }

}
