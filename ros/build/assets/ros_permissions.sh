#!/bin/bash

rosdep fix-permissions \
&& rosdep init \
&& rosdep update