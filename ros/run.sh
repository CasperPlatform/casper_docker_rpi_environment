#!/bin/bash


cd $(dirname $0)
BASEDIR="${PWD}"
VOL="/home/data/casper/c++"
MOUNT="/src/ros"

if [ "$#" == 0 ]; then 
	echo "no params, cmd=bash"
	PAR=bash
else
	echo "par is $1"
	PAR=$1
fi

docker stop rosrpitest && docker rm rosrpitest
echo "running: docker run -d --name rosrpitest -it -v $VOL:$MOUNT casper/ros $PAR"
#docker run -d --name rosrpitest -it -v $VOL:$MOUNT casper/ros $
docker run -d --name rosrpitest -it casper/ros $PAR
#docker exec --user root rosrpitest /bin/sh -c "source /opt/ros/indigo/setup.sh;"

docker exec -it --user root rosrpitest bash
