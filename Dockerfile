FROM businesstools/nginx-php:1.8.0

RUN apt-get update
#RUN apt-get upgrade -y --allow-unauthenticated

RUN apt-get install -y zip \
    curl \
    wget \
    vim \
    nano \
    imagemagick

RUN apt-get install -y xz-utils
RUN apt-get install -y ca-certificates

# ffmpeg setup
COPY ./build-ffmpeg.ubuntu.sh /usr/local/bin/build-ffmpeg
RUN chmod +x /usr/local/bin/build-ffmpeg
RUN build-ffmpeg

ENV PHP_VERSION 7.1

# install php
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq --force-yes \
        php${PHP_VERSION} \
	php${PHP_VERSION}-common \
	php${PHP_VERSION}-curl \
	php${PHP_VERSION}-mcrypt \
    php${PHP_VERSION}-dom
