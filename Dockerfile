# Dockerfile for statsd
#

FROM node:0.12
RUN apt-get -y update
RUN apt-get -y install git

# statsd
RUN mkdir /src && git clone https://github.com/etsy/statsd.git /src/statsd
RUN cd /src/statsd/ && git checkout tags/v0.7.2

ADD config.js /src/statsd/config.js

expose  8125/udp
expose  8126/tcp

CMD ["/usr/bin/node", "/src/statsd/stats.js", "/src/statsd/config.js"]
