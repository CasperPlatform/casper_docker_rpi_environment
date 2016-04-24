#!/bin/bash 
#echo "mounting volume: "$VOLUME"/data"
#DATAVOL=$VOLUME"/data"


docker run -d -p 10080:27017 --name "mongodbdb" \
-v "$VOLUME"  \
"$TAG/$DIR" 
