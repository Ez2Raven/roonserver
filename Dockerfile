FROM ubuntu:20.04

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install bash curl bzip2 ffmpeg cifs-utils alsa-utils \
    && apt-get -y install locales
    
ENV ROON_SERVER_PKG RoonServer_linuxx64.tar.bz2
ENV ROON_SERVER_URL http://download.roonlabs.com/builds/${ROON_SERVER_PKG}
ENV ROON_DATAROOT /data
ENV ROON_ID_DIR /data
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8


VOLUME [ "/app", "/data", "/music", "/backup" ]

ADD run.sh /
RUN chmod 755 /run.sh
ENTRYPOINT /run.sh