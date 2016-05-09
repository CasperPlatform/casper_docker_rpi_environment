#!/bin/bash

docker stop rosrpitest && docker rm rosrpitest
docker run -d --name -it rosrpitest casper/ros bash
docker exec -it --user root rosrpitest bash
