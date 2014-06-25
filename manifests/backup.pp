class elasticsearch::backup(  $instance,
                              $backup_dir = '',
                              $hour       = '4',
                              $minute     = '0')
{

  cron {
    'backup-elasticsearch':
      ensure  => present,
      command => "[ -x /usr/local/bin/es-backup ] && /usr/local/bin/es-backup ${instance} ${backupdir}",
      hour    => $hour,
      minute  => $minute;
  }

  file {
    '/usr/local/bin/es-backup':
      ensure  => present,
      source  => 'puppet:///modules/elasticsearch/es-backup',
      owner   => 'root',
      group   => 'root',
      mode    => '0755';
  }
}
