#!/usr/bin/env bash
cp /tmp/REPOTEMPORAIRE/base/check_stuck_channels.pl /usr/local/nagios/libexec/check_stuck_channels.pl
cd /usr/local/nagios ||  exit 1
chmod -R 755 libexec/

cat <<EOF >> /usr/local/nagios/etc/command_nrpe.cfg
command[check_asterisk_hangup]=/usr/local/nagios/libexec/check_stuck_channels.pl -w 6000 -c 10800 -h 1
EOF
service nrpe reload


