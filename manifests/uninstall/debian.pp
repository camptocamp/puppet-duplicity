class duplicity::uninstall::debian {
  package {'duplicity':
    ensure => purged,
  }

  file {'/usr/local/duplicity/':
    ensure => absent,
    purge  => true,
    force  => true,
    recurse => true,
    backup  => false,
  }

  file {$duplicity::params::logdir :
    ensure => absent,
    purge  => true,
    force  => true,
    recurse => true,
    backup  => false,
  }

  cron {'duplicity backups':
    ensure => absent,
    minute => ip_to_cron(1,59),
    hour   => ip_to_cron(1,5),
    command => '/usr/local/duplicity/duplicity-backups.sh',
  }
}
