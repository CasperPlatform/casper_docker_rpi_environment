#!/bin/bash

cd $(dirname $0)
BASEDIR="${PWD}"

QEMUVOL=$BASEDIR/assets/qemu-arm-static
QEMUMOUNT=/usr/bin/qemu-arm-static

SRCDIR=$1
SRCMOUNT=/root/catkin_ws/src
USBDIR=$2
USBMOUNT=/dev/ttyUSB0

ARCH=$(uname)
echo "$ARCH"

echo "Starting container and spawning a shell"
docker pull corroleaus/casper-ros:beta
docker stop rpi_ros_emulator && docker rm rpi_ros_emulator
if [ "$ARCH" != "Darwin" ] || [ "$#" == 2 ] ; then
	echo "Running with device-flag"
	docker run --name rpi_ros_emulator \
	-v $QEMUVOL:$QEMUMOUNT -v $SRCDIR:$SRCMOUNT --device=$USBDIR:$USBMOUNT \
	-it corroleaus/casper-ros:beta
else
	echo "Running without device-flag"
	docker run --name rpi_ros_emulator \
	-v $QEMUVOL:$QEMUMOUNT -v $SRCDIR:$SRCMOUNT \
	-it corroleaus/casper-ros:beta
fi