FROM alpine:latest
LABEL maintainer="Wells Wei <wellsgz@hotmail.com>"

WORKDIR /root
RUN set -ex \
    && apk add --no-cache ca-certificates tzdata unzip \
    && wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip Xray-linux-64.zip \
    && chmod +x ./xray \
    && mkdir /usr/local/share/xray \
    && cp ./xray /usr/local/bin \
    && cp ./geosite.dat ./geoip.dat /usr/local/share/xray/ \
    && rm -rf /root/*

COPY config.json /usr/local/etc/
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]


