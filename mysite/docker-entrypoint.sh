#!/bin/sh
sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" /mysite/mysite/settings.py
sed -i "s/MYSQL_USER/$MYSQL_USER/g" /mysite/mysite/settings.py
sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /mysite/mysite/settings.py
sed -i "s/MYSQL_HOSTNAME/$MYSQL_HOSTNAME/g" /mysite/mysite/settings.py

export connected="no"
while [ $connected = "no" ]
do
  mysql \
    -u$MYSQL_USER -p$MYSQL_PASSWORD -h$MYSQL_HOSTNAME \
    -e "show tables;" $MYSQL_DATABASE
  if [ $? -eq 0 ] ; then
    export connected="yes"
  fi 
  sleep 1
done 

python manage.py makemigrations polls
python manage.py migrate 
python manage.py shell -c "\
from django.contrib.auth import get_user_model;\
User = get_user_model();\
User.objects.create_superuser('admin', 'admin@example.com', 'admin')\
"

exec "$@"
