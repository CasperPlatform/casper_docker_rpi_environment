#!/bin/bash
source /opt/ros/indigo/setup.bash && source /envi.sh \
&& rosrun hector_mapping mapping_default.launch
