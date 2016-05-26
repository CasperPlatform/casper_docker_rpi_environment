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
RUN rosdep fix-permissions \
	&& rosdep init \
    && rosdep update


RUN rm /bin/sh && ln -s /bin/bash /bin/sh \
&& adduser --disabled-password --gecos "" builder

EXPOSE 6000/udp 9998/udp 9999/udp 10000
RUN apt-get -y install python-pip python-dev && pip install flask flask-restful

RUN chmod -R 755 /opt 
USER builder

RUN echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc  \
&& echo "export ROS_PACKAGE_PATH=~/catkin_ws:$ROS_PACKAGE_PATH" >> ~/.bashrc  \
&& echo "export ROS_WORKSPACE=~/catkin_ws" >> ~/.bashrc   \
&& echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc    \
&& echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc \
&& . ~/.bashrc
USER root
COPY ./assets/envi.sh /
COPY ./entrypoint.sh / 
COPY ./assets/buildLidar.sh / 
COPY ./assets/runSlam.sh /
COPY ./assets/runRest.sh /
COPY ./assets/runVideo.sh /
COPY ./assets/runScore.sh /
COPY ./assets/mapping_default.launch /
COPY ./assets/hector_slam-catkin /hector_slam-catkin


RUN chmod +x /entrypoint.sh && chmod +x /buildLidar.sh && chmod +x /envi.sh \
&& chmod +x /runSlam.sh && chmod +x /runRest.sh && chmod +x /runVideo.sh


WORKDIR /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
