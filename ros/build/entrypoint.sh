#!/bin/bash
set -e

INDIGO=/opt/ros/indigo
SRC=/src/ros/
cd $INDIGO && source setup.sh

if [ "$1" == "buildrun" ]; then
	
	echo "building.."
	cd $SRC && make
	if [ ! -f $SRC/build/lidarserver ]; then
		echo "build failed..."
		exit 1
	fi	
	exec roscore
	exec $SRC/build/lidarserver
elif [ "$1" == "run" ]; then
	if [ ! -f $SRC/build/lidarserver ]; then
		echo "no executable present..."
		exit 1
	fi
	exec $SRC/build/lidarserver
fi
exec bash

#exec "$@"