#!/bin/bash



cd $(dirname $0)

DIR=$(basename $1)
echo $DIR
TAG=casper
VOLUME="/home/data/casper/"$TAG"-"$DIR"/data"
echo "moving into.. "$VOLUME

if [ ! -d "$DIR" ] || [ ! -f "$DIR/build/Dockerfile" ] ; then
	echo "Usage: $0 <basedirectory-of-service>"
	exit 1
fi

mkdir -p $VOLUME

cd $DIR

docker build --rm -t group_one/$DIR ./build/;
