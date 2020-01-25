FROM projectlounge/ubuntu-ffmpeg

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer


ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_NO_INTERACTION=1

RUN composer global require hirak/prestissimo

# install supervisor
RUN apt-get install -y supervisor

RUN apt install -y mysql-client
