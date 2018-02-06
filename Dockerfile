FROM debian:9-slim
MAINTAINER mikafouenski

ARG S6_V="v1.21.2.2"

ENV TERM="xterm" DEBIAN_FRONTEND="noninteractive"

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_V}/s6-overlay-amd64.tar.gz /tmp/s6-overlay.tar.gz

RUN tar xfz /tmp/s6-overlay.tar.gz -C / && \
    useradd -u 2000 -U -d /config -s /bin/false -G users appuser && \
    mkdir /config && \
    apt update && \
    apt install -y --no-install-recommends gnupg2 && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

ADD root /

ENTRYPOINT ["/init"]
