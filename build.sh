#!/bin/bash



cd $(dirname $0)

DIR=$(basename $1)
echo $DIR
TAG=casper
VOLUME="/home/data/casper/"$TAG"-"$DIR"/data"


if [ ! -d "$DIR" ] || [ ! -f "$DIR/build/Dockerfile" ] ; then
	echo "Usage: $0 <basedirectory-of-service>"
	exit 1
fi
if [ ! -d "$VOLUME" ] ; then
	echo "Creating data-dir $VOLUME"
	mkdir -p $VOLUME
fi		


echo "moving into.. ./"$DIR
cd $DIR
echo "Building Image..."
echo building "$TAG/$DIR"
docker build --rm -t "$TAG/$DIR" ./build/;

