#!/bin/bash

cd $(dirname $0)

DIR=$(basename $1)
echo $DIR
TAG=casper

if [ "$#" != 1 ] && [ "$#" != 2 ]; then
	echo "usage: build.sh <servicename> -datadir"
	echo "or: build.sh <servicename if data dir is not required"
	exit 1
fi	

if [ ! -d "$DIR" ] || [ ! -f "$DIR/build/Dockerfile" ] ; then
	echo "Usage: $0 <basedirectory-of-service>"
	exit 1
fi
if [ "$#" == 2 ] && [ "$2" == "-datadir" ]; then
	
	VOLUME="/home/data/casper/"$TAG"-"$DIR"/data"
	if [ ! -d "$VOLUME" ] ; then
		echo "Creating data-dir $VOLUME"
		mkdir -p $VOLUME
	fi
else if [ "$#" == 2 ] && [ "$2" != "-datadir" ]; then
	echo "bad parameter"
	echo "usage: build.sh <servicename> -datadir"
	echo "or: build.sh <servicename if data dir is not required"
	exit 1
fi	 		


echo "moving into.. ./"$DIR
cd $DIR
echo "Building Image..."
echo building "$TAG/$DIR"
docker build --rm -t "$TAG/$DIR" ./build/