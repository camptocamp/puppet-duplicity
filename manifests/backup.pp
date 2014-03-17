# =Definition: duplicity::backup
#
#
define duplicity::backup(
  $destination,
  $ensure      = present,
  $source      = '/',
  $rules       = [],
  $retention   = '30D',
  $full        = '15D',
  $archive_dir = '/root/.cache/duplicity',
  $env_var     = [],
  $args        = '--no-encryption') {
  include duplicity::params

  file {"/usr/local/duplicity/${name}.sh":
    ensure  => $ensure,
    mode    => '0750',
    owner   => 'root',
    group   => 'root',
    content => template('duplicity/backup.erb'),
  }

  file {"/usr/local/duplicity/${name}.include":
    ensure  => $ensure,
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    content => template('duplicity/backup.include.erb'),
  }

  file {"/usr/local/duplicity/${name}.exclude":
    ensure  => $ensure,
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    content => template('duplicity/backup.exclude.erb'),
  }

}
