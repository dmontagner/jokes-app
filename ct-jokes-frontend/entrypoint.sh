#!/bin/bash

export SUPERVISORCONFIG=${SUPERVISORCONFIG:-/etc/supervisor/supervisord.conf}
export SUPERVISORLOGLEVEL=${SUPERVISORLOGLEVEL:-info}

exec /usr/bin/supervisord \
  --configuration=${SUPERVISORCONFIG} \
  --nodaemon \
  --user=root \
  --loglevel=${SUPERVISORLOGLEVEL}