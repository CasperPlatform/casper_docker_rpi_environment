#!/bin/bash

sudp rosdep fix-permissions \
&& rosdep init \
&& rosdep update