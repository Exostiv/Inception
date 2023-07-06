FROM alpine:3.17
ARG PHP_VERSION=81
ARG DOMAIN_NAME
ARG MDP_WPUSR
ARG MDP_WPADM
ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG NICK_WPUSR
ARG NICK_WPADM
ARG MAIL_USR
ARG MAIL_ADM
RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-redis \
    php-phar \
    wget \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php81/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*
WORKDIR /var/www/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv -f wp-cli.phar /usr/local/bin/wp

RUN cd /var/www/
RUN wp core download --allow-root --path="/var/www/"

RUN wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=mariadb --path=/var/www/ --skip-check --allow-root

COPY ./requirements/wordpress/conf/wp-config-create.sh /tmp/
RUN chmod +x /tmp/wp-config-create.sh

CMD ["sh", "/tmp/wp-config-create.sh"]

