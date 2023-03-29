FROM ubuntu:20.04

RUN apt-get update -q \
  && apt-get install --no-install-recommends -y -q \
    ffmpeg \
    libasound2 \
    cifs-utils \
    libicu66 \
    alsa \
    curl \
    wget \
    bzip2 \
    usbutils \
    udev \
    locales \
  && apt-get -q -y clean \
  && rm -rf /var/lib/apt/lists/*

# Roon documented ports
#  - multicast (discovery?)
EXPOSE 9003/udp
# https://community.roonlabs.com/t/what-are-the-new-ports-that-roon-server-needs-open-in-the-firewall/186023/10
EXPOSE 9330-9339/tcp
EXPOSE 30000-30010/tcp
#  - RAAT
EXPOSE 9100-9200/tcp
# ROON ARC
EXPOSE 42839/tcp

ENV ROON_SERVER_PKG RoonServer_linuxx64.tar.bz2
ENV ROON_SERVER_URL http://download.roonlabs.com/builds/${ROON_SERVER_PKG}
ENV ROON_DATAROOT /data
ENV ROON_ID_DIR /data
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

VOLUME [ "/app", "/data", "/music", "/backup" ]

ADD run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT /run.sh
