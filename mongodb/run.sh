#!/bin/bash 
echo $VOLUME

docker run -d -p 10080:27017 --name "mongodb" \
-v $VOLUME/data:/data/db  \
group_one/mongodb; 
