#!/bin/bash
umask 000

chown -R nobody:users /config

exec /sbin/setuser nobody python /opt/sickrage/SickBeard.py --datadir=/config
