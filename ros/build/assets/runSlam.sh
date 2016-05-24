#!/bin/bash

roscore & \
&& source /opt/ros/indigo/setup.bash \
&& roslaunch hector_mapping mapping_default.launch 