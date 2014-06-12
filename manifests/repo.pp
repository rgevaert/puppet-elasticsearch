class elasticsearch::repo ($major_release) {

  apt::key {
    'elasticsearch.org':
      source => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch';
  }

  apt::sources_list {
    'elasticsearch':
      ensure  => present,
      require => Apt::Key['elasticsearch.org'],
      content => $::operatingsystem ? {
        'Debian' => "deb http://packages.elasticsearch.org/elasticsearch/${major_release}/debian stable main",
        'Ubuntu' => "deb http://packages.elasticsearch.org/elasticsearch/${major_release}/debian stable main",
        default  => fail("${::operatingsystem} not supported in elasticsearch::repo")
      };
  }

}
