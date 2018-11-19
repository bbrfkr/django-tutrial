FROM nginx:1.15-alpine

RUN rm -f /etc/nginx/conf.d/*
COPY mysite_nginx.conf /etc/nginx/conf.d/mysite_nginx.conf
COPY docker-entrypoint.sh /usr/bin/
RUN chmod 755 /usr/bin/docker-entrypoint.sh
RUN mkdir /static
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]