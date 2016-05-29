#!/bin/bash

sudo rosdep fix-permissions \
&& sudo rosdep init \
&& rosdep update