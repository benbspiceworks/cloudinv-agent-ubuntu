FROM ubuntu
ENV TERM linux
ENV TZ America/Chicago
ARG DOWNLOAD_URL
ARG SITE_KEY

#update OS, install docker deps, and install (some of the?) agent deps
RUN apt-get -qq update; \
apt-get install -y curl dialog apt-utils tzdata; \
apt-get install -y mono-complete lsb-release parted dmidecode net-tools lshw rpm network-manager upower;

#download, run, remove agent installer
RUN curl -k -o /tmp/agent.deb $DOWNLOAD_URL; \
SITE_KEY=$SITE_KEY TROUBLESHOOTING_HOST="https://api-staging.spiceworks.com/agent-registrar" apt install /tmp/agent.deb; \
rm /tmp/agent.deb;

#bounce agent service
ENTRYPOINT /etc/init.d/agent_shell_service stop && /etc/init.d/agent_shell_service start && tail -F /opt/SpiceworksAgentShell/logs/spiceworks_agent.log;

HEALTHCHECK CMD if [[ $(ps -ef | grep -c AgentShellService.exe)  -ne 1 ]]; then echo 1; else echo 0; fi