FROM debian:buster

RUN apt-get update -y \
	&& apt-get upgrade -y --fix-missing\
	&& apt-get install mariadb-server -y

COPY ./conf/50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb.sh /usr/local/bin/mariadb.sh

ENTRYPOINT ["/bin/bash", "/usr/local/bin/mariadb.sh"]
