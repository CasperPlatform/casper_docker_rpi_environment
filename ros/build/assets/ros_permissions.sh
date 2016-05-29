#!/bin/bash

sudo rosdep fix-permissions \
&& sudo rosdep init \
&& sudo rosdep update