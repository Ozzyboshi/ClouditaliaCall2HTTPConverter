FROM debian:wheezy

MAINTAINER Alessio Garzi "gun101@email.it"

# Install curl for generating HTTP requests
RUN apt-get update && apt-get install -y curl

#Install freeswitch as described on this book : http://www.amazon.it/Costruire-centralini-telefonici-con-FreeSWITCH/dp/8891173096/ref=sr_1_1?ie=UTF8&qid=1439456126&sr=8-1&keywords=freeswitch
RUN echo 'deb http://files.freeswitch.org/repo/deb/debian/ wheezy main' >> /etc/apt/sources.list.d/freeswitch.list
RUN curl http://files.freeswitch.org/repo/deb/debian/freeswitch_archive_g0.pub | apt-key add -
RUN apt-get update && apt-get install -y freeswitch-meta-vanilla freeswitch-conf-vanilla freeswitch-lang freeswitch-sounds freeswitch-music
RUN cp -a /usr/share/freeswitch/conf/vanilla /etc/freeswitch
RUN ls -n /usr/share/freeswitch/conf/vanilla /etc/freeswitch
RUN mkdir -p /usr/local/freeswitch
RUN ln -s /usr/share/freeswitch/conf/vanilla /usr/local/freeswitch/conf

#stuff for Clouditalia accounts configuration
ADD numtemplate.xml /numtemplate.xml
ADD 01_inbound_template.xml /01_inbound_template.xml
ADD varstemplate.xml /varstemplate.xml
ADD start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT /start.sh



