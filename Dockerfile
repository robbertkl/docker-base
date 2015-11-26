FROM debian:jessie
MAINTAINER Robbert Klarenbeek <robbertkl@renbeek.nl>

# Install own scripts and common packages
COPY bin /usr/bin
RUN cleanupgrade
RUN cleaninstall \
    ca-certificates \
    cron \
    curl \
    gettext-base \
    git \
    less \
    nano \
    rsyslog

# Install s6-overlay
RUN curl -sSL https://github.com/just-containers/s6-overlay/releases/download/v1.16.0.1/s6-overlay-amd64.tar.gz \
    | tar xzf - -C /
RUN sed -i "s/s6-nuke -th/s6-nuke -t/" /etc/s6/init/init-stage3

# Configure services
COPY etc /etc
RUN touch /var/log/messages \
    && chmod 600 /etc/crontab \
    && rm -f /etc/cron.daily/apt /etc/cron.daily/dpkg /etc/cron.daily/passwd

# Environment variables
ENV TERM=xterm

# Run s6 service supervisor (not as entrypoint!)
CMD [ "/init" ]
