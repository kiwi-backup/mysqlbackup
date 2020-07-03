#!/bin/bash
set -e
echo "$CRONM $CRONH * * * root /backup_host.sh" >/crontab
exec "$@"
