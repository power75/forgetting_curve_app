#!/usr/bin/env bash
cd $APP
bundle exec whenever --update-crontab
cron -f
# service cron startだと起動しないことがあった
rm -f tmp/pids/server.pid 
./bin/dev