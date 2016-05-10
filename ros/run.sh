#!/bin/bash


cd $(dirname $0)
BASEDIR="${PWD}"
VOL="$BASEDIR/protosrc/"
MOUNT="/src/ros"

docker stop rosrpitest && docker rm rosrpitest
docker run -d --name rosrpitest -it -v $VOL:$MOUNT casper/ros 
#docker exec --user root rosrpitest /bin/sh -c "source /opt/ros/indigo/setup.sh;"
docker exec -it --user root rosrpitest bash
