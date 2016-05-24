#!/bin/bash


source /opt/ros/indigo/setup.bash && source /envi.sh && roscore & \
&& roslaunch hector_mapping mapping_default.launch 