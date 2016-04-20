#!/bin/bash 
echo "mounting volume: "$VOLUME"/data"
DATAVOL=$VOLUME"/data"


docker run -d -p 10080:27017 --name "mongodb" \
-v "$DATAVOL":/data/db  \
group_one/mongodb --smallfiles; 
