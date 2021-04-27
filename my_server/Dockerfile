FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx
RUN apk add openssl


WORKDIR /etc/nginx/sites-available/

COPY ./srcs/start.sh ./
RUN chmod -x ./start.sh

#NGINX CONF
RUN mkdir -p /run/nginx
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf

#SSL
RUN openssl req \
       -newkey rsa:2048 -nodes -keyout /etc/ssl/private/localhost.key \
       -x509 -out /etc/ssl/certs/localhost.crt \
       -subj "/C=RU/ST=Tatarstan/L=Kazan/O=School21-42/OU=drarlean/CN=localhost"

EXPOSE 80 443

CMD sh ./start.sh


