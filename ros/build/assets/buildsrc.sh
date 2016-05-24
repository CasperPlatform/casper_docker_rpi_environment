#!/bin/bash -I

python /home/builder/src/restful/server/restful.py &
source /opt/ros/indigo/setup.bash \
&& roslaunch hector_mapping mapping_default.launch &

source /opt/ros/indigo/setup.bash \
&& source /envi.sh \
&& cd /home/builder/catkin_ws && catkin_make --pkg casper_lidar_scanner_driver \
&& source devel/setup.bash \
&& rosrun casper_lidar_scanner_driver casper_lidar_scanner_driver &

