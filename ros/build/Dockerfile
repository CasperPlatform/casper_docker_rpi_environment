FROM hominidae/armhf-ubuntu

RUN update-locale LANG=C LANGUAGE=C LC_ALL=C LC_MESSAGES=POSIX \
&& echo "deb http://packages.ros.org/ros/ubuntu trusty main" \
> /etc/apt/sources.list.d/ros-latest.list \
&& apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116 
RUN apt-get update && apt-get -y install \
    libjpeg-dev \
	ros-indigo-ros-base \
    ros-indigo-rviz \
	python-rosdep \
    cmake \
    git \
    libboost-system-dev \
    libboost-thread-dev \
    build-essential \
    wget \
    unzip 
    

COPY vc /opt/vc 
RUN cd /tmp \
&& wget http://jaist.dl.sourceforge.net/project/raspicam/raspicam-0.1.3.zip \
&& unzip raspicam-0.1.3.zip -d . && cd raspicam-0.1.3 && chmod -R 755 /tmp/raspicam-0.1.3 \
&& mkdir build && cd build && cmake .. \
&& make && make install && ldconfig



RUN rm /bin/sh && ln -s /bin/bash /bin/sh && apt-get -y install sudo \
&& adduser --disabled-password --gecos "" builder \
&& adduser builder sudo \
&& echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 9998/udp 
RUN apt-get -y install python-pip python-dev && pip install flask flask-restful

RUN chmod -R 755 /opt && mkdir /assets
USER builder

RUN echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc  \
&& echo "export ROS_PACKAGE_PATH=~/catkin_ws:$ROS_PACKAGE_PATH" >> ~/.bashrc  \
&& echo "export ROS_WORKSPACE=~/catkin_ws" >> ~/.bashrc   \
&& echo "export ROS_MASTER_URI=http://192.168.10.2:11311" >> ~/.bashrc    \
&& echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc  \
&& . ~/.bashrc 


USER root
COPY ./assets/envi.sh /assets/
COPY ./entrypoint.sh / 
COPY ./assets/buildLidar.sh /assets/ 
COPY ./assets/runSlam.sh /assets/
COPY ./assets/runRest.sh /assets/
COPY ./assets/runVideo.sh /assets/
COPY ./assets/runScore.sh /assets/
COPY ./assets/mapping_default.launch /assets/
COPY ./assets/hector_slam-catkin /hector_slam-catkin
COPY ./assets/ros_permissions.sh /assets/


RUN chmod +x /entrypoint.sh && chmod -R +x /assets 

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
