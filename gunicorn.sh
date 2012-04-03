#!/bin/bash
set -e
LOGFILE=/srv/example.com/logs/gunicorn.log
LOGDIR=$(dirname $LOGFILE)
NUM_WORKERS=3
# user/group to run as
USER=root
GROUP=root

#DJANGO_SETTINGS_MODULE='production.settings'
cd /srv/example.com/application/current/project

#use virtualenv
source ../../../bin/activate

test -d $LOGDIR || mkdir -p $LOGDIR
exec ../../../bin/gunicorn_django -w $NUM_WORKERS \
	--user=$USER --group=$GROUP --log-level=debug \
	--log-file=$LOGFILE 2>>$LOGFILE
