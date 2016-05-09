FROM proboter/indigo-ros-base-armv7

RUN apt-get update && apt-get -y install \
    cmake \
    git \
    libboost-system-dev \
    libboost-thread-dev 
COPY .bashrc /root/
USER root
RUN source /root/.bashrc    