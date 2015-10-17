#!/bin/bash
(cd /app/backend && bundle install --local --path /gems || bundle install --path /gems)
exec /usr/bin/supervisord -n -c /app/supervisord.conf
