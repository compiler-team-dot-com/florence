#!/bin/sh

# get the current path
CURPATH=`pwd`

inotifywait -mr --timefmt '%d/%m/%y %H:%M' --format '%T %w %f' --exclude '.*\.swp' \
-e modify . | while read date time dir file; do

       FILECHANGE=${dir}${file}
       # convert absolute path to relative
       echo "inotify saw $FILECHANGE"
       FILECHANGEREL=`echo "$FILECHANGE" | sed 's_'$CURPATH'/__'`

       rsync --exclude '.git' --progress -ravz $FILECHANGEREL \
	       ubuntu@ec2-35-164-20-244.us-west-2.compute.amazonaws.com:/home/ubuntu/devel/florence-cpu && \
       echo "At ${time} on ${date}, file $FILECHANGE was backed up via rsync"
done
