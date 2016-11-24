class elasticsearch::install {

  ensure_packages('openjdk-7-jre-headless')

  package {
    $elasticsearch::package:
      ensure  => $elasticsearch::package_ensure,
      require => Package['openjdk-7-jre-headless'];
  }

  # Fix mlockall issue https://github.com/elastic/elasticsearch/issues/9357
  if($::lsbdistcodename == 'jessie')
  {
    include ::systemd

    file {
      '/etc/systemd/system/elasticsearch.service.d':
        ensure => 'directory';
      '/etc/systemd/system/elasticsearch.service.d/1-lockmem.conf':
        ensure => 'file',
        source => 'puppet:///modules/elasticsearch/1-lockmem.conf',
        owner  => 'root',
        group  => 'root',
        notify => Exec['systemctl-daemon-reload'];
      '/etc/systemd/system/elasticsearch.service.d/2-openfiles.conf':
        ensure => 'file',
        source => 'puppet:///modules/elasticsearch/2-openfiles.conf',
        owner  => 'root',
        group  => 'root',
        notify => Exec['systemctl-daemon-reload'];
    }
  }
}
