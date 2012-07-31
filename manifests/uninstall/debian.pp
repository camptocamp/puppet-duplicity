class duplicity::uninstall::debian {
  package {'duplicity':
    ensure => purged,
  }

  file {'/usr/local/duplicity/':
    ensure  => absent,
    purge   => true,
    force   => true,
    recurse => true,
    backup  => false,
  }

  file {$duplicity::params::logdir :
    ensure  => absent,
    purge   => true,
    force   => true,
    recurse => true,
    backup  => false,
  }

  cron {'duplicity backups':
    ensure  => absent,
    minute  => fqdn_rand(60),
    hour    => fqdn_rand(6),
    command => '/usr/local/duplicity/duplicity-backups.sh',
  }
}
