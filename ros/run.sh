#!/bin/bash


cd $(dirname $0)
BASEDIR="${PWD}"
VOL=/home/data/casper/p0015
MOUNT=/root/catkin_ws/src

if [ "$#" == 0 ]; then 
	echo "no params, cmd=bash"
	PAR=bash
else
	echo "par is $1"
	PAR=$1
fi
USBDIR=/dev/ttyUSB0
USBMOUNT=/dev/ttyUSB0

DBDIR=/home/data/casper/db.db
DBMOUNT=/root/db.db

docker stop rosrpitest && docker rm rosrpitest
echo "running: docker run -d --name rosrpitest -it -v $VOL:$MOUNT casper/ros $PAR"
#docker run -d --name rosrpitest -it -v $VOL:$MOUNT casper/ros $
docker run -d --name rosrpitest -it -v $VOL:$MOUNT --device=$USBDIR:$USBMOUNT \
-v $DBDIR:$DBMOUNT -p 9999:9999 -p 6000:6000 -p 9998:9998  casper/ros $PAR
#docker exec --user root rosrpitest /bin/sh -c "source /opt/ros/indigo/setup.sh;"

docker exec -it --user root rosrpitest bash
