FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add influxdb supervisor\
			telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/

COPY /supervisord.conf /etc/supervisord.conf

COPY /telegraf.conf /etc/telegraf/telegraf.conf

COPY start.sh ./

#SET VOLUME PATH
VOLUME	["var/lib/influxdb"]

EXPOSE 8086

CMD sh ./start.sh
