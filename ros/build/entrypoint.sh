#!/bin/bash
set -e
set -x

INDIGO=/opt/ros/indigo
SRC=/src/ros
LIDARSRC=$SRC/lidarserver
DRIVESRC=$SRC/driveserver
RESTFULSRC=/root/restful/server
cd $INDIGO && source setup.sh

if [ "$1" == "buildrun" ]; then
	
	echo "building..lidarserver" >> /dev/stdout 
	cd $LIDARSRC && make
	if [ ! -f $LIDARSRC/build/lidarserver ]; then
		echo "build failed..." 2>&1
		exit 1
	fi	
	exec roscore &
	sleep 8
	exec $LIDARSRC/build/lidarserver &
	echo "Building driveserver" >> /dev/stdout
	cd $DRIVESRC && make
	if [ ! -f $DRIVESRC/build/driveserver ]; then
		echo "build failed..." 2>&1
		exit 1
	fi	
	echo "driveserver built.. executing" >> /dev/stdout
	exec $DRIVESRC/build/driveserver

elif [ "$1" == "run" ]; then
	if [ ! -f $LIDARSRC/build/lidarserver ]; then
		echo "no executable present..." 2>&1
		exit 1
	fi
	exec $SRC/build/lidarserver
	
	python $RESTFULSRC/restful.py &
fi

mkdir -p /root/catkin_ws/src
mkdir -p /root/restful
mkdir -p /root/cpp

exec bash

#exec "$@"