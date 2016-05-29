#!/bin/bash

sudo rosdep fix-permissions \
&& rosdep init \
&& rosdep update