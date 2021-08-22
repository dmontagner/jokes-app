FROM jokes_base:no-chuck

LABEL org.opencontainers.image.authors="diogomontagner.net"
ARG DEBIAN_FRONTEND=noninteractive


#ADD     ubuntu-sources.list /etc/apt/sources.list
#
#RUN     apt-get -y update && \
#        apt-get -y upgrade
#
#RUN     apt-get -y install \
#            python3.9 \
#            net-tools \
#            vim \
#            python3-pip && \
#        apt-get clean && \
#        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN     mkdir /app
RUN     mkdir /var/log/app/

RUN     pip install flask
RUN     pip install pyjokes
COPY    chuck-norris-jokes.py /app
COPY    run-flask.sh /app
COPY    applications.conf /etc/supervisor/conf.d/
COPY    entrypoint.sh /app

WORKDIR /app

ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]