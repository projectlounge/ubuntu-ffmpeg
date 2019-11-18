FROM businesstools/nginx-php:1.8.0

RUN apt-get update
#RUN apt-get upgrade -y --allow-unauthenticated

RUN apt-get install -y git zip
RUN apt-get install -y imagemagick
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y xz-utils
RUN apt-get install -y ca-certificates
RUN apt-get install -y vim

# ffmpeg setup
COPY ./build-ffmpeg.ubuntu.sh /usr/local/bin/build-ffmpeg
RUN chmod +x /usr/local/bin/build-ffmpeg
RUN build-ffmpeg

# install php
RUN apt-get install -y php7.0 \
	php7.0-cli \
	php7.0-common \
	php7.0-curl \
	php7.0-fpm \
	php7.0-json \
	php7.0-mbstring \
	php7.0-mcrypt \
	php7.0-mysql \
	php7.0-opcache \
	php7.0-xml \
	php7.0-zip \
    php7.0-dom \
	php7.0-gd \
    php-xdebug \
    libapache2-mod-php7.0


