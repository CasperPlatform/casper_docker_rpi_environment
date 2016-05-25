#!/bin/bash
source /opt/ros/indigo/setup.bash && source /envi.sh \
&& roslaunch -p 11311 hector_mapping mapping_default.launch
