FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add mysql mysql-client
RUN apk add nginx
RUN apk add openssl
RUN apk add supervisor

COPY mysql.sh ./
COPY wordpress.sql ./
COPY my.cnf /etc/my.cnf
RUN mkdir -p /run/mysqld/ && chmod +x /run/mysqld

RUN chmod +x ./mysql.sh &&\
       chmod +x /etc/my.cnf
	

#SUPERVISOR
COPY supervisor.conf /etc/supervisord.conf

#SET VOLUME PATH
VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD sh ./mysql.sh