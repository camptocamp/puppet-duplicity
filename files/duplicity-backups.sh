#!/bin/sh
# File managed by Puppet

for i in /usr/local/duplicity/*.sh; do
  if [ $(basename $i) != duplicity-backups.sh ]; then
    $i
  fi
done
