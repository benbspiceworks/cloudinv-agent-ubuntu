FROM ubuntu
ENV TERM linux
ENV TZ America/Chicago
ARG DOWNLOAD_URL
ARG SITE_KEY

RUN apt-get -qq update

#docker dependencies
RUN apt-get install -y curl dialog apt-utils tzdata

#agent dependencies
RUN apt-get install -y mono-complete lsb-release parted dmidecode net-tools lshw rpm network-manager upower

#download agent
RUN curl -k -o /tmp/agent.deb $DOWNLOAD_URL

#install agent, cleanup
RUN SITE_KEY=$SITE_KEY TROUBLESHOOTING_HOST="https://api-staging.spiceworks.com/agent-registrar" apt install /tmp/agent.deb; \
rm /tmp/agent.deb

ENTRYPOINT service agent_shell_service stop && service agent_shell_service start && bash
