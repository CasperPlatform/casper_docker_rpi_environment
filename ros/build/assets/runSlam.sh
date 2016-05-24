#!/bin/bash


source /opt/ros/indigo/setup.bash && roscore & \
&& roslaunch hector_mapping mapping_default.launch 