class elasticsearch::curator ($version = '3') {

  $repo = $::operatingsystem ? {
    'Debian' => "deb http://packages.elastic.co/curator/${version}/debian stable main",
    'Ubuntu' => "deb http://packages.elastic.co/curator/${version}/debian stable main",
    default  => fail("${::operatingsystem} not supported in elasticsearch::repo")
  }

  apt::key {
    'elasticsearch.org-curator':
      source => 'http://packages.elastic.co/GPG-KEY-elasticsearch';
  }

  apt::sources_list {
    'elasticsearch-curator':
      ensure  => present,
      require => Apt::Key['elasticsearch.org-curator'],
      content => $repo;
  }

  package {
    'python-elasticsearch-curator':
      ensure => 'installed',
      require => Apt::Sources_list['elasticsearch-curator'];
  }
}
