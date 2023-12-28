#!/bin/sh
# vim:sw=4:ts=4:et

service cron start

{ echo "59 23 * * * /usr/sbin/logrotate -f /etc/logrotate.conf"; } | crontab

sh /docker-entrypoint.sh nginx -g 'daemon off;'
