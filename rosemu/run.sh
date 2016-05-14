#!/bin/bash


cd $(dirname $0)
BASEDIR="${PWD}"

SRCVOL="$HOME/Documents/coding/sem/systemsDev/c++/p0010"
SRCMOUNT="/src/ros"
EMUVOL="/Users/pontus/Documents/coding/endian/it/docker/rpi_emulator/qemu-arm-static"
EMUMOUNT="/usr/bin/qemu-arm-static"

if [ "$#" == 0 ]; then 
	echo "no params, cmd=bash"
	PAR=bash
else
	echo "par is $1"
	PAR=$1
fi

docker stop rosrpitest && docker rm rosrpitest
echo "running: docker run -d --name rosrpitest -it -v $VOL:$MOUNT casper/ros $PAR"
docker run -d --name rosrpitest -it -v $SRCVOL:$SRCMOUNT -v /usr/bin/ \
corroleaus/casper-ros $PAR
#docker exec --user root rosrpitest /bin/sh -c "source /opt/ros/indigo/setup.sh;"

docker exec -it --user root rosrpitest bash
