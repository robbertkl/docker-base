FROM debian:jessie
MAINTAINER Robbert Klarenbeek <robbertkl@renbeek.nl>

# Install own scripts and common packages
COPY bin /usr/bin
RUN cleanupgrade
RUN cleaninstall \
    ca-certificates \
    curl \
    gettext-base \
    git \
    less \
    nano

# Environment variables
ENV TERM=xterm
