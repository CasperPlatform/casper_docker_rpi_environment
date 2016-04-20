#!/bin/bash

cd $(dirname $0)

DIR=$(basename $1)


if [ ! -d "$DIR" ] || [ ! -f "$DIR/build/Dockerfile" ] ; then
	echo "Usage: $0 <basedirectory-of-service>"
	exit 1
fi    

# inherit container specific run-configuration?
if [! -f "$DIR/run.sh" ]; then
	echo "Missing container specific run script, aborting..."
    exit 1
fi

echo "Running " $DIR " specific run script.. "
export $DIR
. "$DIR/run.sh"

