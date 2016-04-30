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
COPY repair_db.sh /repair_db.sh
RUN mkdir -p /data/db && chown -R mongodb:mongodb /data/db && chown mongodb:mongodb /repair_db.sh \
&& chmod +x /repair_db.sh
#COPY repair_db.sh /data/db
VOLUME ["/data/db"]
#WORKDIR /data


# Expose MongoDB ports
EXPOSE 27017 28017

# Define default command.
#CMD ["/usr/bin/mongod","--smallfiles"]
#ENTRYPOINT usr/bin/mongod


ENTRYPOINT ["/repair_db.sh"]
CMD ["mongod", "--repair"]
