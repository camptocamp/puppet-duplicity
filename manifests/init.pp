# See README.md for details.
class duplicity (
  $logdir = '/var/log/duplicity',
) {
  case $::operatingsystem {
    Debian, Ubuntu: { include duplicity::debian }
    default: { fail "${::operatingsystem} not yet implemented for ${name}" }
  }
}
