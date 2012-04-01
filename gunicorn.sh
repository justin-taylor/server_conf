#!/bin/bash
set -e
LOGFILE=/var/log/gunicorn/example.log
LOGDIR=$(dirname $LOGFILE)
NUM_WORKERS=3
# user/group to run as
USER=root
GROUP=root
cd /srv/example.com/current/test_app
#source ../bin/activate
test -d $LOGDIR || mkdir -p $LOGDIR
exec gunicorn_django -w $NUM_WORKERS \
	--user=$USER --group=$GROUP --log-level=debug \
	--log-file=$LOGFILE 2>>$LOGFILE
