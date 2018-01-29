FROM debian:9-slim
MAINTAINER mikafouenski

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.2.2/s6-overlay-amd64.tar.gz /tmp/s6-overlay.tar.gz

RUN tar xfz /tmp/s6-overlay.tar.gz -C / && \
  useradd -u 2000 -U -d /config -s /bin/false -G users appuser && \
  mkdir /config

ADD root /

ENTRYPOINT ["/init"]
