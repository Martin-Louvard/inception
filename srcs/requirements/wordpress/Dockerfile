FROM debian:buster

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get -y install wget \
	php7.3 \
	php-fpm \
	php-mysql

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/config.sh /usr/local/bin
RUN chmod +x /usr/local/bin/config.sh
ENTRYPOINT ["/usr/local/bin/config.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]










