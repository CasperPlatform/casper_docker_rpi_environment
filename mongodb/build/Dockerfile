# Dockerfile to build it yourself
FROM resin/rpi-raspbian

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

###############################
# Configure timezone and locale
###############################
RUN echo "Europe/Amsterdam" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata
RUN apt-get install -y locales apt-utils
RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen
ENV LANGUAGE en_US:en
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

###############################
# MongoDB
###############################
RUN apt-get install -y mongodb-server

RUN mkdir -p /data/db && chown -R mongodb:mongodb /data/db

VOLUME ["/data/db"]
#WORKDIR /data


# Expose MongoDB ports
EXPOSE 27017 28017

# Define default command.
#CMD ["/usr/bin/mongod","--smallfiles"]
#ENTRYPOINT usr/bin/mongod
CMD ["mongod"]
