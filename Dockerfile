FROM ubuntu:14.04

# File Author / Maintainer
MAINTAINER Raju Dawadi <rajudawadinp@gmail.com>

# Set the enviroment variable
ENV DEBIAN_FRONTEND noninteractive

# Install required packages
RUN apt-get update --fix-missing

RUN apt-get --allow-unauthenticated -y install wget nano gcc g++ make libncurses5-dev libjansson-dev libxml2-dev libsqlite3-dev libxslt-dev uuid-dev 

RUN wget -c http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-13.13.1.tar.gz

RUN tar -xvzf asterisk-13.13.1.tar.gz && cd asterisk-13.13.1

RUN cd asterisk-13.13.1 && ./configure && make && make install && make samples

RUN sed -i "s/rtpend=20000/rtpend=10010/g" /etc/asterisk/rtp.conf

ADD conf/ /etc/asterisk/