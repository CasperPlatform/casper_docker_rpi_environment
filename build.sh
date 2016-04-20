#!/bin/bash

cd $(dirname $0)

DIR=$(basename $1)

echo $DIR

#docker build --rm -t group_one/mongodb ./build/;
