#!/bin/bash

if [ ! -f /home/builder/src/cpp/build/videoserver ]; then
    
    cd /home/builder/src/cpp/videoserver && make

    if [ ! -f /home/builder/src/cpp/build/videoserver ]; then
            echo "build failed..." 2>&1
            exit 1
        fi	
	
    echo "driveserver built.. executing" >> /dev/stdout
fi

exec /home/builder/src/cpp/videoserver