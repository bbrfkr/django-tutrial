#!/bin/sh
sed -i "s/UWSGI_HOST/$UWSGI_HOST/g" /etc/nginx/conf.d/mysite_nginx.conf
exec "$@"
