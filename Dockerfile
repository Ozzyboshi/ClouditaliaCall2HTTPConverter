FROM debian:wheezy

MAINTAINER Alessio Garzi "gun101@email.it"

RUN apt-get update && apt-get install -y curl procps locate joe git
RUN echo 'deb http://files.freeswitch.org/repo/deb/debian/ wheezy main' >> /etc/apt/sources.list.d/freeswitch.list
RUN curl http://files.freeswitch.org/repo/deb/debian/freeswitch_archive_g0.pub | apt-key add -
RUN apt-get update && apt-get install -y freeswitch-meta-vanilla freeswitch-conf-vanilla freeswitch-lang freeswitch-sounds freeswitch-music
RUN cp -a /usr/share/freeswitch/conf/vanilla /etc/freeswitch
RUN ls -n /usr/share/freeswitch/conf/vanilla /etc/freeswitch
RUN mkdir -p /usr/local/freeswitch
RUN ln -s /usr/share/freeswitch/conf/vanilla /usr/local/freeswitch/conf
ENV lol=11
ADD numtemplate.xml /numtemplate.xml
ADD 01_inbound_template.xml /01_inbound_template.xml
ADD varstemplate.xml /varstemplate.xml
ADD start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT /start.sh



