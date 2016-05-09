#!/bin/bash

docker stop rosrpitest && docker rm rosrpitest
docker run -d --name rosrpitest -it casper/ros bash
docker exec -it --user root rosrpitest bash
