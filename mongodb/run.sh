#!/bin/bash 
#echo "mounting volume: "$VOLUME"/data"
#DATAVOL=$VOLUME"/data"


docker run -p 10080:27017 --name "mongodb" \
-v "$VOLUME"  \
"$TAG/$DIR" 
