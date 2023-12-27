#!/bin/sh
# vim:sw=4:ts=4:et

service cron start

sh /docker-entrypoint.sh nginx -g 'daemon off;'
