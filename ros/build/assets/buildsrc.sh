#!/bin/bash -I

source /opt/ros/indigo/setup.bash && source /envi.sh \
&& cd /home/builder/catkin_ws && catkin_make --pkg casper_lidar_scanner_driver 
python /home/builder/src/restful/server/restful.py &

