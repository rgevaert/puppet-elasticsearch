class elasticsearch::repo {

  apt::key {
    'elasticsearch.org':
      source => 'http://packages.elastic.co/GPG-KEY-elasticsearch';
  }

  $repo = $::operatingsystem ? {
        'Debian' => "deb http://packages.elastic.co/elasticsearch/${::elasticsearch::major_release}/debian stable main",
        'Ubuntu' => "deb http://packages.elastic.co/elasticsearch/${::elasticsearch::major_release}/debian stable main",
        default  => fail("${::operatingsystem} not supported in elasticsearch::repo")
  }

  apt::sources_list {
    'elasticsearch':
      ensure  => present,
      require => Apt::Key['elasticsearch.org'],
      content => $repo;
  }

}
