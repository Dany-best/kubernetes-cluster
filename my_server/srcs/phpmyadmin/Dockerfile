FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add nginx wget supervisor

RUN apk add php7 php7-fpm php7-common php7-session php7-iconv php7-json\
	php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo\
	php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext\
	php7-ldap php7-ctype php7-dom php7-mbstring

#NGINX
RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

#PHPMA
RUN mkdir -p /www
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz
#RUN rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /www/phpmyadmin
COPY ./config.inc.php /www/phpmyadmin/

#SUPERVISOR
COPY supervisord.conf /etc/supervisord.conf
COPY start.sh ./
RUN chmod +x start.sh

EXPOSE 5000

CMD sh ./start.sh
