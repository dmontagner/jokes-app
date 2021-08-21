FROM ubuntu:focal

LABEL org.opencontainers.image.authors="diogomontagner.net"
ARG DEBIAN_FRONTEND=noninteractive

ADD     ubuntu-sources.list /etc/apt/sources.list

RUN     apt-get -y update && \
        apt-get -y upgrade

RUN     apt-get -y install \
            python3.9 \
            net-tools \
            vim \
            supervisor \
            python3-pip && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

