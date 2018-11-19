FROM python:3.6-alpine3.8

# install django uwsgi and PyMySQL
RUN apk --no-cache --virtual .requirements add g++ make linux-headers && \
    apk --no-cache add libffi-dev mysql-dev mysql-client && \
    pip install Django uwsgi mysqlclient && rm -rf ~/.cache/pip && \
    apk del .requirements

# install mysite
RUN mkdir /mysite
COPY ./mysite/ /mysite/
WORKDIR /mysite

EXPOSE 8001
COPY docker-entrypoint.sh /usr/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["uwsgi", "--socket", ":8001", "--module", "mysite.wsgi"]
