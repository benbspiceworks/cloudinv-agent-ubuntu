FROM ubuntu
ENV TERM linux

ARG DOWNLOAD_URL
ARG SITE_KEY

RUN apt-get -qq update; \
apt-get install -y mono-complete curl dialog apt-utils tzdata

RUN curl -k -o agent.deb $DOWNLOAD_URL

RUN SITE_KEY=$SITE_KEY dpkg -i agent.deb
