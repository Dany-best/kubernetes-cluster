FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add supervisor vsftpd openssl
RUN mkdir -p /var/ftp

#SSL
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj \
	"/C=RU/ST=Republic_of_Tatarstan/L=Kazan/OU=School21/CN=drarlean" \
	-keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.pem

RUN adduser -D dany && echo "dany:1234" | chpasswd

COPY /vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY supervisord.conf /etc/supervisord.conf

COPY start.sh ./
RUN chmod +x /etc/vsftpd/vsftpd.conf && chmod +x start.sh
EXPOSE 21 21212

#RUN sh
CMD sh start.sh
