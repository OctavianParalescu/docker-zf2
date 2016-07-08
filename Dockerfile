FROM php:5.6-apache

MAINTAINER Octavian Paralescu <me@octav.info>

# update and install packages
RUN apt-get -qq update \
        && apt-get -qq upgrade -y \
        && apt-get install -y libpng12-dev libjpeg-dev && rm -rf /var/lib/apt/lists/* \
        && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
        && docker-php-ext-install gd mysqli opcache

# adding assets
ADD assets/ /assets/

EXPOSE 80

ENTRYPOINT ["/assets/entrypoint.sh"]
