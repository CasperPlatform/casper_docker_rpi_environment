#!/bin/bash
source /opt/ros/indigo/setup.bash && source /envi.sh \
&& roslaunch -p 11311 hector_slam_launch mapping_default.launch
 