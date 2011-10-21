define duplicity::backup(
  $ensure=present,
  $destination,
  $source='/',
  $excludes=[],
  $includes=[],
  $retention='30D',
  $full='15D',
  $gpg_passphrase='',
  $archive_dir='/root/.cache/duplicity',
  $args='--no-encryption') {
  include duplicity::params

  file {"/usr/local/duplicity/${name}.sh":
    ensure => $ensure,
    mode    => 0750,
    owner   => 'root',
    group   => 'root',
    content => template('duplicity/backup.erb'),
  }

  file {"/usr/local/duplicity/${name}.include":
    ensure => $ensure,
    mode   => 0640,
    owner  => 'root',
    group  => 'root',
    content => template('duplicity/backup.include.erb'),
  }

  file {"/usr/local/duplicity/${name}.exclude":
    ensure => $ensure,
    mode   => 0640,
    owner  => 'root',
    group  => 'root',
    content => template('duplicity/backup.exclude.erb'),
  }

}
