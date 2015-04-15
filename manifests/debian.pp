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

  $module_path = get_module_path($module_name)
  file {'/usr/local/duplicity/duplicity-backups.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0750',
    content => file("${module_path}/files/duplicity-backups.sh"),
  }

  cron {'duplicity backups':
    ensure  => present,
    minute  => fqdn_rand(60),
    hour    => fqdn_rand(6),
    command => '/usr/local/duplicity/duplicity-backups.sh',
  }
}
