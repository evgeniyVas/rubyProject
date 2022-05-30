#!/bin/sh

set -e

if [ -f $APP_PATH/tmp/pids/server.pid ]; then
  rm $APP_PATH/tmp/pids/server.pid
fi

bundle exec sidekiq