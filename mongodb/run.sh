#!/bin/bash 

docker run -d -p 10080:27017 --name "mongodb" \
-v $DIR:/data/db  \
group_one/mongodb; 
