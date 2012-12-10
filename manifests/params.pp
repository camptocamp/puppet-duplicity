class duplicity::params {
  $logdir = $duplicity_logdir? {
    ''      => '/var/log/duplicity',
    default => $duplicity_logdir,
  }
}
