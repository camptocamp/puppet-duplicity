class duplicity::uninstall {
  case $::operatingsystem {
    Debian, Ubuntu: { include duplicity::uninstall::debian }
    default: { fail "${::operatingsystem} not yet implemented for $name" }
  }
}
