#!/bin/bash
#echo "mounting volume: "$VOLUME"/data"
#DATAVOL=$VOLUME"/data"


docker run -i -p 10080:27017 -p 10081:28017 --name "mongodb" \
-v "$VOLUME:/data/db"  \
"$TAG/$DIR"
