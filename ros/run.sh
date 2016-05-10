#!/bin/bash


cd $(dirname $0)
BASEDIR="${PWD}"
VOL="$BASEDIR/protosrc/"
MOUNT="/src/ros"

if [ "$#" == 0 ]; then 
	PAR=bash
else
	PAR=$1
fi

docker stop rosrpitest && docker rm rosrpitest
docker run -d --name rosrpitest -it -v $VOL:$MOUNT casper/ros $PAR
#docker exec --user root rosrpitest /bin/sh -c "source /opt/ros/indigo/setup.sh;"
docker exec -it --user root rosrpitest bash
