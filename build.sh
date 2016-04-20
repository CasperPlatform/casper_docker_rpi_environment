#!/bin/bash

set e

cd $(dirname $0)

DIR=$(basename $1)
TAG=casper
VOLUME=$("/home/data/casper/"$TAG"-"$DIR"/data")
echo $VOLUME

cd $DIR

mkdir -p $VOLUME

#docker build --rm -t group_one/mongodb ./build/;
