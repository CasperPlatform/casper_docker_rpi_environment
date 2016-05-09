#!/bin/bash

SRC="${PWD}"
VOL="$SRC/protosrc"
MOUNT="/src/ros"

docker stop rosrpitest && docker rm rosrpitest
docker run -d --name rosrpitest -it -v $VOL:$MOUNT casper/ros bash
docker exec -it --user root rosrpitest bash
