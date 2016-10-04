# Make snapshosts of ES instance and clean up older
# This subclass is legacy.  Use elasticsearch::curator to install the curator package
# And then add the relevant other cronjobs or scripts
class elasticsearch::backup(  $instance,
                              $backup_dir     = '',
                              $hour           = '4',
                              $minute         = '0',
                              $retention_days = '7')
{

  cron {
    'backup-elasticsearch':
      ensure  => present,
      command => "[ -x /usr/local/bin/es-backup ] && /usr/local/bin/es-backup ${instance} ${backup_dir}",
      hour    => $hour,
      minute  => $minute;
    'cleanup-elasticsearch-snapshots':
      ensure  => present,
      command => "/usr/local/bin/curator --timeout 1800 delete snapshots --repository ${instance} --older-than ${retention_days} --time-unit days --timestring '\%Y-\%m-\%d_\%H:\%M:\%S' >/dev/null",
      hour    => 0,
      minute  => 5;
  }

  file {
    '/usr/local/bin/es-backup':
      ensure  => file,
      source  => 'puppet:///modules/elasticsearch/es-backup',
      owner   => 'root',
      group   => 'root',
      mode    => '0755';
  }

  # Ter info.  Nu hebben we voor wheezy zelf een pakket gemaakt maar
  # elasticsearch voorziet zelf ook packages in hun eigen repo.
  # Voor een nieuwere versie kunnen we best die gebruiken.
  package {
    'python-setuptools':
      ensure => present;
    'python-elasticsearch-curator':
      ensure  => present,
      require =>  Package['python-setuptools'];
  }

}
