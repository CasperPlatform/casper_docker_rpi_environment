#!/bin/bash
set -e

if [ -f "./mongod.lock" ] then;
    rm ./mongod.lock
fi    
exec "$@"