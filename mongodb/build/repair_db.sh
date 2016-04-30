#!/bin/bash
set -e

if [ -f "./mongod.lock" ] ; then
    echo "removing lock file"
    rm ./mongod.lock
fi   
mongod --repair 
exec "$@"