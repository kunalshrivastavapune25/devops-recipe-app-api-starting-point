#!/bin/sh
set -e

echo "Waiting for API to be available..."

while ! nc -z ${APP_HOST} ${APP_PORT}; do
  sleep 2
done

echo "API is up, starting nginx"

envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;'
