FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx wget supervisor\
	telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/

#NGINX
RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir www

#TELEGRAF
COPY /telegraf.conf /etc/telegraf/telegraf.conf

#PHP
RUN apk add php7 php7-fpm php7-common php7-session php7-iconv php7-json\
	php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo\
	php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext\
	php7-ldap php7-ctype php7-dom php7-mbstring

#WORDPRESS
RUN mkdir -p /usr/share/webapps/ && cd /usr/share/webapps/ && \
    wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && \
    rm -rf latest.tar.gz && ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
COPY start.sh ./
RUN chmod +x start.sh
COPY ./wp-config.php /usr/share/webapps/wordpress/
RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php

#SUPERVISOR
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 5050

#CMD supervisord
CMD sh ./start.sh
