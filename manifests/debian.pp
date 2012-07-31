class duplicity::debian {
  include duplicity::params

  package {'duplicity':
    ensure => present,
  }

  file {$duplicity::params::logdir :
    ensure => directory,
    owner  => 'root',
    group  => 'adm',
    mode   => '0750',
  }

  tidy {$duplicity::params::logdir :
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
    ensure => present,
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
