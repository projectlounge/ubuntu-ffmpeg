FROM businesstools/nginx-php:1.8.0

RUN apt-get update -qq && apt-get -y install \
    zip \
    curl \
    wget \
    vim \
    nano \
    imagemagick \
    supervisor \
    xz-utils \
    ca-certificates \
    mysql-client \
    autoconf \
    automake \
    build-essential \
    cmake \
    git-core \
    libass-dev \
    libfreetype6-dev \
    libsdl2-dev \
    libtool \
    libva-dev \
    libvdpau-dev \
    libvorbis-dev \
    libxcb1-dev \
    libxcb-shm0-dev \
    libxcb-xfixes0-dev \
    pkg-config \
    texinfo \
    zlib1g-dev \
    bzip2 \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

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


# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer


ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_NO_INTERACTION=1

RUN composer global require hirak/prestissimo
