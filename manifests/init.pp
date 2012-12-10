class duplicity {
  case $::operatingsystem {
    Debian, Ubuntu: { include duplicity::debian }
    default: { fail "${::operatingsystem} not yet implemented for $name" }
  }
}
