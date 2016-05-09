FROM proboter/indigo-ros-base-armv7

RUN apt-get update && apt-get -y install \
    cmake \
    git \
    libboost-system-dev \
    libboost-thread-dev \
    build-essential
COPY .bashrc /root/
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
USER root
RUN source /root/.bashrc && source /opt/ros/indigo/setup.sh \
&& mkdir -p /src/ros && chmod -R 755 /src

