#!/bin/sh

set -e

if [ -f $APP_PATH/tmp/pids/server.pid ]; then
  rm $APP_PATH/tmp/pids/server.pid
fi
if [ -e $APP_PATH ]; then
  bundle exec rake db:create db:migrate
  bundle exec rake db:seed
fi

bundle exec rails s -b 0.0.0.0