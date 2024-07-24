#!/bin/bash
set -e
rm -f /api/tmp/pids/server.pid
bundle exec rake db:migrate
exec "$@"