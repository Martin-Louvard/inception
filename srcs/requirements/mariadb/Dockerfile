FROM debian:buster

RUN apt-get update -y \
	&& apt-get upgrade -y --fix-missing\
	&& apt-get install mariadb-server -y \
	mariadb-client

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var /var/run /var/run/mysqld /run/mysqld /var/lib/mysql

EXPOSE 3306

COPY ./conf/mariadb.cnf etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb.sh /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
