# Dockerfile for statsd
#
# VERSION               0.1
# DOCKER-VERSION        0.4.0

FROM ubuntu:trusty
RUN apt-get -y update
RUN apt-get -y install software-properties-common
RUN apt-get -y install python-software-properties
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get -y update

RUN apt-get -y install git \
                       nodejs

# statsd
RUN mkdir /src && git clone https://github.com/etsy/statsd.git /src/statsd

ADD config.js /src/statsd/config.js

expose  8125/udp
expose  8126/tcp

CMD ["/usr/bin/node", "/src/statsd/stats.js", "/src/statsd/config.js"]
