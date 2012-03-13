/*

=Definition: duplicity::backup

*/
define duplicity::backup(
  $ensure=present,
  $source='/',
  $destination,
  $encrypt_key,
  $excludes=[],
  $includes=[],
  $retention='30D',
  $full='15D',
  $archive_dir='/root/.cache/duplicity',
  $tempdir='/tmp',
  $env_var=[],
  $options=['--no-encryption']) {

  include duplicity::params

  file {"/usr/local/duplicity/${name}.sh":
    ensure => $ensure,
    mode    => 0750,
    owner   => 'root',
    group   => 'root',
    content => template('duplicity/backup.erb'),
  }

}
