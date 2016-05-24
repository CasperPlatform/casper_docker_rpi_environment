#!/bin/bash

cd $(dirname $0)
BASEDIR="${PWD}"

SYSDEV=/Users/pontus/Documents/coding/sem/systemDev

QEMUVOL=$BASEDIR/assets/qemu-arm-static
QEMUMOUNT=/usr/bin/qemu-arm-static

VOL=$SYSDEV/c++/p0015/
RESTVOL="$SYSDEV/python/p0006"
CPPVOL=$SYSDEV/c++/p0010
MOUNT=/home/builder/catkin_ws/src
RESTMOUNT=/home/builder/src/restful
CPPMOUNT=/home/builder/src/cpp

DBDIR=$SYSDEV/db.db
DBMOUNT=/home/builder/db.db

USBDIR=$2
USBMOUNT=/dev/ttyUSB0

ARCH=$(uname)
echo "$ARCH"

echo "Starting container and spawning a shell"
#docker pull corroleaus/casper-ros:beta
docker stop rpi_ros_emulator && docker rm rpi_ros_emulator
if [ "$ARCH" != "Darwin" ] || [ "$#" == 2 ] ; then
	echo "Running with device-flag"
	docker run --name rpi_ros_emulator \
	-v $QEMUVOL:$QEMUMOUNT -v $SRCDIR:$SRCMOUNT --device=$USBDIR:$USBMOUNT \
	-it corroleaus/casper-ros:alpha
else
	echo "Running without device-flag"
	docker run --name rpi_ros_emulator \
	-v $QEMUVOL:$QEMUMOUNT -v $VOL:$MOUNT -v $RESTVOL:$RESTMOUNT -v $CPPVOL:$CPPMOUNT  \
	-v $DBDIR:$DBMOUNT --device="/dev/tty:$USBMOUNT" -it corroleaus/casper-ros:alpha
	#docker exec -it --user builder rpi_ros_emulator bash -v /buildLidar.sh
	#docker exec -it --user builder rpi_ros_emulator bash -v /runRest.sh
	#docker exec -it --user builder rpi_ros_emulator bash -v /runSlam.sh
	#docker exec -it --user builder rpi_ros_emulator bash -v /runVideo.sh
fi