# See README.md for details.
class duplicity::debian {

  package {'duplicity':
    ensure => present,
  }

  file {$duplicity::logdir :
    ensure => directory,
    owner  => 'root',
    group  => 'adm',
    mode   => '0750',
  }

  tidy {$duplicity::logdir :
    age     => '1W',
    recurse => true,
    matches => '*.log',
  }

  file {'/usr/local/duplicity/':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0750',
    purge   => true,
    force   => true,
    recurse => true,
    backup  => false,
  }

  file {'/usr/local/duplicity/duplicity-backups.sh':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
    source => 'puppet:///modules/duplicity/duplicity-backups.sh',
  }

  cron {'duplicity backups':
    ensure  => present,
    minute  => fqdn_rand(60),
    hour    => fqdn_rand(6),
    command => '/usr/local/duplicity/duplicity-backups.sh',
  }
}
