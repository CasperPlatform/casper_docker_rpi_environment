#!/bin/bash 

docker run -d -p 10080:27017 --name "mongodb" \
-v /home/data/docker/mongodb/data/db:/data/db  \
group_one/mongodb; 
