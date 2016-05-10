#!/bin/bash
set -e

INDIGO=/opt/ros/indigo
SRC=/src/ros/rosproto

cd /opt/ros/indigo && source setup.sh



exec "$@"