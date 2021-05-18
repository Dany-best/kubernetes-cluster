FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add supervisor
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/
RUN apk --no-cache add ca-certificates wget

#GRAFANA
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.0.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
RUN rm -rf grafana-7.4.0.linux-amd64.tar.gz
RUN apk --no-cache add ca-certificates wget
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk
COPY grafana.db /grafana-7.4.0/data/grafana.db

COPY supervisord.conf /etc/supervisord.conf
COPY /telegraf.conf /etc/telegraf/telegraf.conf
COPY start.sh ./
RUN ln -s grafana-7.4.0/bin/grafana-server ./grafana-server

EXPOSE 3000

CMD sh ./start.sh

