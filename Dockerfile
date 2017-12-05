FROM ubuntu:16.04
MAINTAINER Pavel Kirpitsov

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      apt-utils \
      apache2 \
      php \
      php-cli \
      libapache2-mod-php \
      php-gd \
      php-json \
      php-mbstring \
      php-mysql \
      php-opcache \
      php-xml \
      php-xsl \
      php-zip \
      php-soap \
      php-xdebug \
      composer

COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite
RUN a2enmod vhost_alias

EXPOSE 80
CMD ["/usr/local/bin/run"]
