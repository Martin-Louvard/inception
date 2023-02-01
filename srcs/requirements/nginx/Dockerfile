FROM debian:buster

RUN apt-get -y update \
	&& apt-get -y install nginx \
	&& apt-get -y install openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/malouvar.crt \
	-keyout /etc/nginx/ssl/malouvar.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=malouvar.42.fr/UID=malouvar"

RUN mkdir -p /var/run/nginx
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf



EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
