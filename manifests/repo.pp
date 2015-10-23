class elasticsearch::repo {

  apt::key {
    'elasticsearch.org':
      source => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch';
  }

  $repo = $::operatingsystem ? {
        'Debian' => "deb http://packages.elasticsearch.org/elasticsearch/${::elasticsearch::major_release}/debian stable main",
        'Ubuntu' => "deb http://packages.elasticsearch.org/elasticsearch/${::elasticsearch::major_release}/debian stable main",
        default  => fail("${::operatingsystem} not supported in elasticsearch::repo")
  };

  apt::sources_list {
    'elasticsearch':
      ensure  => present,
      require => Apt::Key['elasticsearch.org'],
      content => $repo;
  }

}
