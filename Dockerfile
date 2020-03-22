FROM lsiobase/ubuntu:bionic

# set label
LABEL maintainer="vshen"
ENV TZ=Asia/Shanghai AUTOEXIT=true PUID=1000 PGID=100

# install subfinder
RUN apt -y update && apt -y install python3 python3-pip vim unrar \
&&  pip3 install --upgrade pip \
&&  pip install subfinder \
&&  echo "**** cleanup ****" \
&&  apt-get clean \
&&  rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# copy local files
COPY root/ /

# volumes
VOLUME /config	/libraries
